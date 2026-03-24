package app.revanced.extension.gamehub;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * Displays the signed-in user's GOG library as scrollable game cards.
 *
 * Library sync flow:
 *   1. Proactive token expiry check → refresh if needed
 *   2. GET user/data/games → owned game IDs
 *   3. Per ID: GET products/{id}?expand=downloads,description → metadata
 *   4. Check builds?generation=2 → store gog_gen_{id}
 *   5. Build card views on main thread
 *
 * Card layout (per game):
 *   [colored bar] | [Gen badge] | title | category · developer | size info
 *   [✓ Installed] (if installed)
 *   [ProgressBar] [status text]
 *   [Install / Downloading / Add] button
 *
 * Detail dialog (card tap):
 *   title / description / genre+developer / Uninstall / Copy to Downloads
 */
public class GogGamesActivity extends Activity {

    private static final String TAG = "BH_GOG";

    private final Handler uiHandler = new Handler(Looper.getMainLooper());
    private TextView syncText;
    private LinearLayout gameListLayout;
    private ScrollView scrollView;
    private SharedPreferences prefs;

    // ── Lifecycle ─────────────────────────────────────────────────────────────

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        prefs = getSharedPreferences("bh_gog_prefs", 0);
        buildUi();
        startSync();
    }

    // ── UI construction ───────────────────────────────────────────────────────

    private void buildUi() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(0xFF0D0D0D);

        // Header
        LinearLayout header = new LinearLayout(this);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setBackgroundColor(0xFF1A1A2E);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(dp(8), dp(8), dp(8), dp(8));

        Button backBtn = new Button(this);
        backBtn.setText("←");
        backBtn.setTextColor(0xFFFFFFFF);
        backBtn.setBackgroundColor(0xFF333333);
        backBtn.setTextSize(16f);
        backBtn.setPadding(dp(12), 0, dp(12), 0);
        backBtn.setOnClickListener(v -> finish());
        header.addView(backBtn, new LinearLayout.LayoutParams(-2, dp(40)));

        TextView titleTV = new TextView(this);
        titleTV.setText("GOG Library");
        titleTV.setTextColor(0xFFFF9800);
        titleTV.setTextSize(18f);
        titleTV.setTypeface(null, Typeface.BOLD);
        titleTV.setPadding(dp(12), 0, 0, 0);
        header.addView(titleTV, new LinearLayout.LayoutParams(0, -2, 1f));

        root.addView(header, new LinearLayout.LayoutParams(-1, -2));

        // Sync status text
        syncText = new TextView(this);
        syncText.setText("Loading GOG library…");
        syncText.setTextColor(0xFFCCCCCC);
        syncText.setTextSize(13f);
        syncText.setPadding(dp(12), dp(6), dp(12), dp(6));
        syncText.setBackgroundColor(0xFF111111);
        root.addView(syncText, new LinearLayout.LayoutParams(-1, -2));

        // Scrollable game list
        scrollView = new ScrollView(this);
        scrollView.setBackgroundColor(0xFF0D0D0D);
        scrollView.setVisibility(View.GONE);

        gameListLayout = new LinearLayout(this);
        gameListLayout.setOrientation(LinearLayout.VERTICAL);
        gameListLayout.setPadding(dp(8), dp(8), dp(8), dp(8));
        scrollView.addView(gameListLayout, new FrameLayout.LayoutParams(-1, -2));

        root.addView(scrollView, new LinearLayout.LayoutParams(-1, 0, 1f));
        setContentView(root);
    }

    // ── Library sync (background thread) ─────────────────────────────────────

    private void startSync() {
        new Thread(this::syncLibrary, "gog-sync").start();
    }

    private void syncLibrary() {
        try {
            setSync("Checking token…");

            // Proactive token expiry check
            String token = prefs.getString("access_token", null);
            if (token == null) { setSync("Not logged in"); return; }

            int loginTime  = prefs.getInt("bh_gog_login_time", 0);
            int expiresIn  = prefs.getInt("bh_gog_expires_in", 3600);
            int nowSec     = (int) (System.currentTimeMillis() / 1000L);
            if (loginTime == 0 || nowSec >= loginTime + expiresIn) {
                setSync("Refreshing token…");
                String newToken = GogTokenRefresh.refresh(this);
                if (newToken == null) { setSync("Session expired — please sign in again"); return; }
                token = newToken;
            }

            setSync("Fetching game list…");

            // Step 1: owned game IDs
            String gamesJson = httpGet("https://embed.gog.com/user/data/games", token);
            if (gamesJson == null) { setSync("Failed to fetch library"); return; }

            List<String> ids = new ArrayList<>();
            try {
                JSONObject obj = new JSONObject(gamesJson);
                JSONArray ownedArr = obj.optJSONArray("owned");
                if (ownedArr != null) {
                    for (int i = 0; i < ownedArr.length(); i++) {
                        ids.add(String.valueOf(ownedArr.getLong(i)));
                    }
                }
            } catch (Exception e) {
                setSync("Error parsing library"); return;
            }

            if (ids.isEmpty()) { setSync("No games found in library"); return; }

            // Step 2: per-ID metadata fetch
            final String finalToken = token;
            List<GogGame> games = new ArrayList<>();
            int count = 0;
            for (String id : ids) {
                // Skip known non-game IDs
                if ("1801418160".equals(id)) continue;
                count++;
                setSync("Syncing game " + count + " / " + ids.size() + "…");

                try {
                    String productJson = httpGet(
                            "https://api.gog.com/products/" + id
                            + "?expand=downloads,description", finalToken);
                    if (productJson == null) continue;

                    JSONObject prod = new JSONObject(productJson);
                    if (prod.optBoolean("is_secret", false)) continue;
                    if ("dlc".equals(prod.optString("game_type"))) continue;

                    // Title
                    JSONObject title = prod.optJSONObject("title");
                    String titleStr = title != null ? title.optString("*") : null;
                    if (titleStr == null) titleStr = prod.optString("title");
                    if (titleStr == null || titleStr.isEmpty()) continue;

                    // Image URL
                    JSONObject images = prod.optJSONObject("images");
                    String imageUrl = images != null ? images.optString("background") : "";
                    if (imageUrl == null) imageUrl = "";

                    // Description
                    JSONObject descObj = prod.optJSONObject("description");
                    String desc = descObj != null ? descObj.optString("lead") : "";
                    if (desc == null) desc = "";

                    // Developer
                    JSONObject company = prod.optJSONObject("developers");
                    String developer = "";
                    if (company instanceof JSONObject) {
                        developer = company.optString("name", "");
                    } else {
                        // Sometimes it's a string
                        developer = prod.optString("developer", "");
                    }

                    // Category / genre
                    JSONArray genres = prod.optJSONArray("genres");
                    String category = "";
                    if (genres != null && genres.length() > 0) {
                        JSONObject g = genres.optJSONObject(0);
                        if (g != null) category = g.optString("name", "");
                    }

                    // Generation
                    int generation = 0;
                    try {
                        String buildsJson2 = httpGet(
                                "https://api.gog.com/products/" + id
                                + "/os/windows/builds?generation=2", finalToken);
                        if (buildsJson2 != null) {
                            JSONObject bObj = new JSONObject(buildsJson2);
                            JSONArray bitems = bObj.optJSONArray("items");
                            if (bitems != null && bitems.length() > 0) generation = 2;
                        }
                    } catch (Exception ignored) {}
                    if (generation == 0) generation = 1;

                    // Store generation
                    prefs.edit().putInt("gog_gen_" + id, generation).apply();

                    games.add(new GogGame(id, titleStr, imageUrl, desc, developer, category, generation));
                } catch (Exception e) {
                    Log.w(TAG, "Skipping product " + id + ": " + e.getMessage());
                }
            }

            // Build cards on main thread
            final List<GogGame> finalGames = games;
            uiHandler.post(() -> {
                gameListLayout.removeAllViews();
                if (finalGames.isEmpty()) {
                    setSync("No compatible games found");
                    return;
                }
                for (GogGame g : finalGames) addGameCard(g);
                setSync(finalGames.size() + " game(s) — tap a card to install");
                scrollView.setVisibility(View.VISIBLE);
            });
        } catch (Exception e) {
            Log.e(TAG, "syncLibrary error", e);
            setSync("Error: " + e.getMessage());
        }
    }

    // ── Game card builder ─────────────────────────────────────────────────────

    private void addGameCard(GogGame game) {
        // Outer card
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(10), dp(10), dp(10), dp(10));

        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setColor(0xFF1A1A2E);
        cardBg.setCornerRadius(dp(6));
        card.setBackground(cardBg);
        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(-1, -2);
        cardLp.bottomMargin = dp(8);
        card.setFocusable(true);

        // Gen badge
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);

        if (game.generation > 0) {
            TextView genBadge = new TextView(this);
            genBadge.setText("Gen " + game.generation);
            genBadge.setTextSize(10f);
            genBadge.setTextColor(0xFFFFFFFF);
            genBadge.setPadding(dp(5), dp(2), dp(5), dp(2));
            GradientDrawable badgeBg = new GradientDrawable();
            badgeBg.setColor(game.generation == 2 ? 0xFF4FC3F7 : 0xFFFF9800);
            badgeBg.setCornerRadius(dp(3));
            genBadge.setBackground(badgeBg);
            LinearLayout.LayoutParams badgeLp = new LinearLayout.LayoutParams(-2, -2);
            badgeLp.rightMargin = dp(8);
            row.addView(genBadge, badgeLp);
        }

        // Title
        TextView titleTV = new TextView(this);
        titleTV.setText(game.title);
        titleTV.setTextColor(0xFFFFFFFF);
        titleTV.setTextSize(15f);
        titleTV.setTypeface(null, Typeface.BOLD);
        row.addView(titleTV, new LinearLayout.LayoutParams(0, -2, 1f));
        card.addView(row, new LinearLayout.LayoutParams(-1, -2));

        // Category · Developer
        if (!game.category.isEmpty() || !game.developer.isEmpty()) {
            String meta = game.category.isEmpty() ? game.developer
                        : game.developer.isEmpty() ? game.category
                        : game.category + " · " + game.developer;
            TextView metaTV = new TextView(this);
            metaTV.setText(meta);
            metaTV.setTextColor(0xFF888888);
            metaTV.setTextSize(11f);
            LinearLayout.LayoutParams metaLp = new LinearLayout.LayoutParams(-1, -2);
            metaLp.topMargin = dp(4);
            card.addView(metaTV, metaLp);
        }

        // ✓ Installed checkmark (hidden unless installed)
        TextView checkmark = new TextView(this);
        checkmark.setText("✓ Installed");
        checkmark.setTextColor(0xFF4CAF50);
        checkmark.setTextSize(10f);
        boolean isInstalled = prefs.getString("gog_exe_" + game.gameId, null) != null;
        checkmark.setVisibility(isInstalled ? View.VISIBLE : View.GONE);
        LinearLayout.LayoutParams ckLp = new LinearLayout.LayoutParams(-1, -2);
        ckLp.topMargin = dp(4);
        card.addView(checkmark, ckLp);

        // ProgressBar (hidden until download starts)
        ProgressBar progressBar = new ProgressBar(this, null,
                android.R.attr.progressBarStyleHorizontal);
        progressBar.setMax(100);
        progressBar.setProgress(0);
        progressBar.setVisibility(View.GONE);
        LinearLayout.LayoutParams pbLp = new LinearLayout.LayoutParams(-1, dp(6));
        pbLp.topMargin = dp(6);
        card.addView(progressBar, pbLp);

        // Status text (hidden until download starts)
        TextView statusTV = new TextView(this);
        statusTV.setTextColor(0xFFAAAAAA);
        statusTV.setTextSize(11f);
        statusTV.setVisibility(View.GONE);
        LinearLayout.LayoutParams stLp = new LinearLayout.LayoutParams(-1, -2);
        stLp.topMargin = dp(2);
        card.addView(statusTV, stLp);

        // Install / Add button
        Button actionBtn = new Button(this);
        boolean alreadyInstalled = isInstalled;
        actionBtn.setText(alreadyInstalled ? "Add to Launcher" : "Install");
        actionBtn.setTextColor(0xFFFFFFFF);
        actionBtn.setBackgroundColor(alreadyInstalled ? 0xFF2E7D32 : 0xFF7033FF);
        actionBtn.setTextSize(13f);
        LinearLayout.LayoutParams abLp = new LinearLayout.LayoutParams(-1, dp(40));
        abLp.topMargin = dp(8);
        card.addView(actionBtn, abLp);

        // Button click handler
        actionBtn.setOnClickListener(v -> {
            if ("Add to Launcher".equals(actionBtn.getText().toString())) {
                String exePath = prefs.getString("gog_exe_" + game.gameId, null);
                if (exePath != null) {
                    GogLaunchHelper.triggerLaunch(this, exePath);
                }
                return;
            }
            // Start install
            actionBtn.setEnabled(false);
            actionBtn.setText("Downloading…");
            actionBtn.setBackgroundColor(0xFF555555);
            progressBar.setVisibility(View.VISIBLE);
            statusTV.setVisibility(View.VISIBLE);

            GogDownloadManager.startDownload(this, game, new GogDownloadManager.Callback() {
                @Override public void onProgress(String msg, int pct) {
                    uiHandler.post(() -> {
                        statusTV.setText(msg);
                        progressBar.setProgress(pct);
                    });
                }
                @Override public void onComplete(String exePath) {
                    uiHandler.post(() -> {
                        progressBar.setProgress(100);
                        checkmark.setVisibility(View.VISIBLE);
                        if (exePath != null && !exePath.isEmpty()) {
                            statusTV.setText("Opening GameHub import…");
                            GogLaunchHelper.triggerLaunch(GogGamesActivity.this, exePath);
                        } else {
                            statusTV.setText("Installed — no exe found");
                            actionBtn.setText("Add to Launcher");
                            actionBtn.setBackgroundColor(0xFF2E7D32);
                            actionBtn.setEnabled(true);
                        }
                    });
                }
                @Override public void onError(String msg) {
                    uiHandler.post(() -> {
                        statusTV.setText("Error: " + msg);
                        actionBtn.setText("Install");
                        actionBtn.setBackgroundColor(0xFF7033FF);
                        actionBtn.setEnabled(true);
                        Toast.makeText(GogGamesActivity.this, "Error: " + msg,
                                Toast.LENGTH_LONG).show();
                    });
                }
            });
        });

        // Card tap → detail dialog
        card.setOnClickListener(v -> showDetailDialog(game, checkmark));
        gameListLayout.addView(card, cardLp);
    }

    // ── Dialogs ───────────────────────────────────────────────────────────────

    /** Detail dialog: description + Uninstall + Copy to Downloads. */
    private void showDetailDialog(GogGame game, View checkmark) {
        AlertDialog.Builder b = new AlertDialog.Builder(this);
        b.setTitle(game.title);

        StringBuilder msg = new StringBuilder();
        if (!game.developer.isEmpty()) msg.append("Developer: ").append(game.developer).append("\n");
        if (!game.category.isEmpty())  msg.append("Genre: ").append(game.category).append("\n");
        if (!game.description.isEmpty()) msg.append("\n").append(game.description);
        b.setMessage(msg.toString().trim());

        b.setPositiveButton("Close", null);

        String installedExe = prefs.getString("gog_exe_" + game.gameId, null);
        if (installedExe != null) {
            b.setNegativeButton("Uninstall", (dialog, which) -> uninstall(game, checkmark));
            b.setNeutralButton("Launch / Add", (dialog, which) ->
                    GogLaunchHelper.triggerLaunch(this, installedExe));
        }

        b.show();
    }

    private void uninstall(GogGame game, View checkmark) {
        String dirName = prefs.getString("gog_dir_" + game.gameId, null);
        if (dirName != null) {
            new Thread(() -> {
                java.io.File installPath = GogInstallPath.getInstallDir(this, dirName);
                deleteDir(installPath);
                prefs.edit()
                        .remove("gog_dir_" + game.gameId)
                        .remove("gog_exe_" + game.gameId)
                        .remove("gog_cover_" + game.gameId)
                        .apply();
                uiHandler.post(() -> {
                    checkmark.setVisibility(View.GONE);
                    Toast.makeText(this, game.title + " uninstalled", Toast.LENGTH_SHORT).show();
                });
            }).start();
        }
    }

    private void copyToDownloads(GogGame game) {
        Toast.makeText(this, "Copying to Downloads…", Toast.LENGTH_SHORT).show();
        new Thread(() -> {
            String dest = GogDownloadManager.copyToDownloads(this, game.gameId);
            uiHandler.post(() -> {
                if (dest != null) {
                    Toast.makeText(this, "Copied to: " + dest, Toast.LENGTH_LONG).show();
                } else {
                    Toast.makeText(this, "Copy failed — check storage permission",
                            Toast.LENGTH_SHORT).show();
                }
            });
        }).start();
    }

    // ── Utilities ─────────────────────────────────────────────────────────────

    private void setSync(String msg) {
        uiHandler.post(() -> syncText.setText(msg));
    }

    private int dp(int v) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v,
                getResources().getDisplayMetrics());
    }

    private static String httpGet(String url, String token) {
        try {
            HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setConnectTimeout(20000);
            conn.setReadTimeout(20000);
            if (token != null) conn.setRequestProperty("Authorization", "Bearer " + token);
            if (conn.getResponseCode() != 200) { conn.disconnect(); return null; }
            StringBuilder sb = new StringBuilder();
            try (BufferedReader br = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(), "UTF-8"))) {
                String line;
                while ((line = br.readLine()) != null) sb.append(line);
            }
            conn.disconnect();
            return sb.toString();
        } catch (Exception e) { return null; }
    }

    private static void deleteDir(java.io.File dir) {
        if (dir == null || !dir.exists()) return;
        java.io.File[] children = dir.listFiles();
        if (children != null) for (java.io.File c : children) deleteDir(c);
        dir.delete();
    }
}
