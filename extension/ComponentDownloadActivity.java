package app.revanced.extension.gamehub;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Gravity;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * BannerHub Lite — Online Component Downloader.
 *
 * 3-level navigation:
 *   Level 1: Repo list
 *   Level 2: Category selection (DXVK / VKD3D / Box64 / FEXCore / GPU Driver)
 *   Level 3: Asset list → download + inject into component folder
 *
 * Supports two fetch modes:
 *   GITHUB_RELEASES — fetches GitHub Releases API, finds latest nightly-* tag assets
 *   PACK_JSON       — fetches a flat JSON array (type/verName/remoteUrl format)
 */
@SuppressWarnings("unused")
public class ComponentDownloadActivity extends Activity {

    private static final String TAG = "BannerHub";

    // ── Repo definitions ──────────────────────────────────────────────────────

    private static class Repo {
        final String name;
        final String url;
        Repo(String name, String url) {
            this.name = name; this.url = url;
        }
    }

    private static final Repo[] REPOS = {
        new Repo("Arihany WCPHub",
            "https://raw.githubusercontent.com/Arihany/WinlatorWCPHub/refs/heads/main/pack.json"),
        new Repo("Kimchi GPU Drivers",
            "https://raw.githubusercontent.com/The412Banner/Nightlies/refs/heads/main/kimchi_drivers.json"),
        new Repo("StevenMXZ GPU Drivers",
            "https://raw.githubusercontent.com/The412Banner/Nightlies/refs/heads/main/stevenmxz_drivers.json"),
        new Repo("MTR GPU Drivers",
            "https://raw.githubusercontent.com/The412Banner/Nightlies/refs/heads/main/mtr_drivers.json"),
        new Repo("Whitebelyash GPU Drivers",
            "https://raw.githubusercontent.com/The412Banner/Nightlies/refs/heads/main/white_drivers.json"),
        new Repo("The412Banner Nightlies",
            "https://raw.githubusercontent.com/The412Banner/Nightlies/refs/heads/main/nightlies_components.json"),
    };

    private static final String[] CATEGORIES = {
        "DXVK", "VKD3D", "Box64", "FEXCore", "GPU Driver", "All"
    };

    // ── State ─────────────────────────────────────────────────────────────────

    private int selectedRepoIdx;
    private String selectedCategory;
    private int selectedContentType; // EmuComponents type for selectedCategory
    private String targetComponent; // pre-selected component (from intent extra)
    private File componentsDir;

    private Handler uiHandler;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        uiHandler = new Handler(Looper.getMainLooper());
        componentsDir = new File(getFilesDir(), "usr/home/components");
        targetComponent = getIntent().getStringExtra("target_component");
        showRepos();
    }

    // ── Level 1: Repo list ────────────────────────────────────────────────────

    private void showRepos() {
        List<String> rows = new ArrayList<>();
        for (Repo r : REPOS) rows.add(r.name);

        LinearLayout root = buildRoot("Download from Online Repos");
        buildList(root, rows).setOnItemClickListener((p, v, pos, id) -> {
            selectedRepoIdx = pos;
            showCategories();
        });
        setContentView(root);
    }

    // ── Level 2: Category ─────────────────────────────────────────────────────

    private void showCategories() {
        List<String> rows = new ArrayList<>();
        for (String c : CATEGORIES) rows.add(c);
        rows.add("Back");

        LinearLayout root = buildRoot(REPOS[selectedRepoIdx].name);
        buildList(root, rows).setOnItemClickListener((p, v, pos, id) -> {
            String cat = rows.get(pos);
            if (cat.equals("Back")) { showRepos(); return; }
            selectedCategory = cat;
            selectedContentType = categoryToType(cat);
            fetchAndShowAssets();
        });
        setContentView(root);
    }

    // ── Level 3: Asset list ───────────────────────────────────────────────────

    private void fetchAndShowAssets() {
        LinearLayout loading = buildRoot("Loading...");
        ProgressBar pb = new ProgressBar(this);
        pb.setIndeterminate(true);
        loading.addView(pb);
        setContentView(loading);

        Repo repo = REPOS[selectedRepoIdx];
        new Thread(() -> {
            try {
                List<AssetItem> assets = fetchPackJson(repo.url);

                // Filter by category
                List<AssetItem> filtered = new ArrayList<>();
                for (AssetItem a : assets) {
                    if (selectedCategory.equals("All") || matchesCategory(a.name, selectedCategory)) {
                        filtered.add(a);
                    }
                }

                uiHandler.post(() -> showAssetList(filtered));
            } catch (Exception e) {
                Log.e(TAG, "fetchAndShowAssets failed", e);
                uiHandler.post(() -> {
                    Toast.makeText(this, "Load failed: " + e.getMessage(), Toast.LENGTH_LONG).show();
                    showCategories();
                });
            }
        }).start();
    }

    private void showAssetList(List<AssetItem> assets) {
        if (assets.isEmpty()) {
            Toast.makeText(this, "No assets found for category: " + selectedCategory, Toast.LENGTH_SHORT).show();
            showCategories();
            return;
        }

        List<String> rows = new ArrayList<>();
        for (AssetItem a : assets) rows.add(a.name);
        rows.add("Back");

        LinearLayout root = buildRoot(REPOS[selectedRepoIdx].name + " / " + selectedCategory);
        buildList(root, rows).setOnItemClickListener((p, v, pos, id) -> {
            if (rows.get(pos).equals("Back")) { showCategories(); return; }
            downloadAndInject(assets.get(pos));
        });
        setContentView(root);
    }

    // ── Download + Inject ─────────────────────────────────────────────────────

    private void downloadAndInject(AssetItem asset) {
        // Determine target component folder
        String componentFolder;
        if (targetComponent != null && !targetComponent.isEmpty()) {
            componentFolder = targetComponent;
        } else {
            // Use asset filename (without extension) as folder name
            // e.g. "Mesa_Turnip_26.1.0_R4.zip" → "Mesa_Turnip_26.1.0_R4"
            String folderName = asset.name;
            int dot = folderName.lastIndexOf('.');
            if (dot > 0) folderName = folderName.substring(0, dot);
            componentFolder = folderName;
        }

        File destDir = new File(componentsDir, componentFolder);

        LinearLayout loading = buildRoot("Downloading...");
        TextView status = new TextView(this);
        status.setText("Downloading: " + asset.name);
        status.setGravity(Gravity.CENTER);
        loading.addView(status);
        ProgressBar pb = new ProgressBar(this);
        pb.setIndeterminate(true);
        loading.addView(pb);
        setContentView(loading);

        final int contentType = selectedContentType;
        new Thread(() -> {
            File cacheFile = null;
            try {
                // Download to cache
                cacheFile = new File(getCacheDir(), asset.name);
                downloadFile(asset.downloadUrl, cacheFile);

                // Extract + register with EmuComponents
                ComponentInjectorHelper.injectFromCachedFile(
                        this, cacheFile, componentFolder, contentType);

                uiHandler.post(() -> {
                    Toast.makeText(this,
                            "Installed: " + asset.name + " → " + componentFolder,
                            Toast.LENGTH_LONG).show();
                    finish();
                });
            } catch (Exception e) {
                Log.e(TAG, "downloadAndInject failed", e);
                uiHandler.post(() -> {
                    Toast.makeText(this, "Install failed: " + e.getMessage(), Toast.LENGTH_LONG).show();
                    showCategories();
                });
            } finally {
                if (cacheFile != null) cacheFile.delete();
            }
        }).start();
    }

    // ── Fetch: pack.json ──────────────────────────────────────────────────────

    private List<AssetItem> fetchPackJson(String url) throws Exception {
        String json = httpGet(url);
        JSONArray arr = new JSONArray(json);
        List<AssetItem> result = new ArrayList<>();

        for (int i = 0; i < arr.length(); i++) {
            JSONObject obj = arr.getJSONObject(i);
            String type = obj.optString("type", "");
            String verName = obj.optString("verName", "");
            String remoteUrl = obj.optString("remoteUrl", "");

            // Skip Wine/Proton (type unknown in GameHub)
            if (type.equalsIgnoreCase("wine") || type.equalsIgnoreCase("proton")) continue;

            if (remoteUrl.isEmpty()) continue;

            // Derive filename from last URL segment
            String filename = remoteUrl.substring(remoteUrl.lastIndexOf('/') + 1);
            if (filename.isEmpty()) filename = type + "-" + verName + ".wcp";

            result.add(new AssetItem(filename, remoteUrl));
        }
        return result;
    }

    // ── HTTP helper ───────────────────────────────────────────────────────────

    private String httpGet(String urlStr) throws Exception {
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setConnectTimeout(15000);
        conn.setReadTimeout(30000);
        conn.setRequestProperty("User-Agent", "BannerHub-Lite/1.0");
        conn.setRequestProperty("Accept", "application/json");

        int code = conn.getResponseCode();
        if (code != 200) throw new Exception("HTTP " + code + " for " + urlStr);

        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(conn.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) sb.append(line);
        }
        return sb.toString();
    }

    private void downloadFile(String urlStr, File dest) throws Exception {
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setConnectTimeout(15000);
        conn.setReadTimeout(120000);
        conn.setRequestProperty("User-Agent", "BannerHub-Lite/1.0");

        if (conn.getResponseCode() != 200)
            throw new Exception("Download HTTP " + conn.getResponseCode());

        byte[] buf = new byte[8192];
        try (InputStream in = conn.getInputStream();
             FileOutputStream fos = new FileOutputStream(dest)) {
            int n;
            while ((n = in.read(buf)) > 0) fos.write(buf, 0, n);
        }
    }

    // ── Category → EmuComponents type ────────────────────────────────────────

    private static int categoryToType(String category) {
        switch (category) {
            case "DXVK":       return ComponentInjectorHelper.TYPE_DXVK;
            case "VKD3D":      return ComponentInjectorHelper.TYPE_VKD3D;
            case "Box64":      return ComponentInjectorHelper.TYPE_BOX64;
            case "FEXCore":    return ComponentInjectorHelper.TYPE_FEXCORE;
            case "GPU Driver": return ComponentInjectorHelper.TYPE_GPU_DRIVER;
            default:           return ComponentInjectorHelper.TYPE_GPU_DRIVER; // fallback for "All"
        }
    }

    // ── Category matching ─────────────────────────────────────────────────────

    private boolean matchesCategory(String filename, String category) {
        String lower = filename.toLowerCase();
        switch (category) {
            case "DXVK":       return lower.contains("dxvk");
            case "VKD3D":      return lower.contains("vkd3d");
            case "Box64":      return lower.contains("box64");
            case "FEXCore":    return lower.contains("fex") || lower.contains("fexcore");
            case "GPU Driver":
                return lower.contains("turnip") || lower.contains("adreno")
                        || lower.contains("driver") || lower.contains("vulkan")
                        || lower.contains("qualcomm") || lower.contains("freedreno");
            default:           return true;
        }
    }

    // ── UI helpers ────────────────────────────────────────────────────────────

    private LinearLayout buildRoot(String title) {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(48, 48, 48, 48);

        TextView tv = new TextView(this);
        tv.setText(title);
        tv.setTextSize(18f);
        tv.setGravity(Gravity.CENTER);
        tv.setPadding(0, 0, 0, 24);
        root.addView(tv);
        return root;
    }

    private ListView buildList(LinearLayout root, List<String> items) {
        ArrayAdapter<String> adapter = new ArrayAdapter<>(
                this, android.R.layout.simple_list_item_1, items);
        ListView lv = new ListView(this);
        lv.setAdapter(adapter);
        root.addView(lv, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f));
        return lv;
    }

    // ── Data class ────────────────────────────────────────────────────────────

    private static class AssetItem {
        final String name;
        final String downloadUrl;
        AssetItem(String name, String downloadUrl) {
            this.name = name; this.downloadUrl = downloadUrl;
        }
        @Override public String toString() { return name; }
    }
}
