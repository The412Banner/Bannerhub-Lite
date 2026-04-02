package app.revanced.extension.gamehub;

import android.app.Activity;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

/**
 * Injects / syncs BhFrameRating (Winlator HUD) and BhDetailedHud into WineActivity's DecorView.
 * Called from WineActivity.onResume() via smali injection in build-quick.yml.
 */
public final class BhHudInjector {

    private static final String TAG = "BannerHub";

    private BhHudInjector() {}

    /**
     * Call from WineActivity.onResume().
     * - Reads "winlator_hud" and "hud_extra_detail" booleans from bh_prefs.
     * - Manages BhFrameRating (tag "bh_frame_rating") and BhDetailedHud (tag "bh_detailed_hud").
     * - If extra detail is enabled, shows BhDetailedHud and hides BhFrameRating.
     * - If normal HUD enabled (and not extra detail), shows BhFrameRating.
     */
    public static void injectOrUpdate(Activity activity) {
        if (activity == null) return;
        try {
            android.view.Window window = activity.getWindow();
            if (window == null) return;

            View contentView = window.getDecorView().findViewById(android.R.id.content);
            if (!(contentView instanceof ViewGroup)) return;
            ViewGroup container = (ViewGroup) contentView;

            boolean hudEnabled = activity.getSharedPreferences("bh_prefs", 0)
                    .getBoolean("winlator_hud", false);
            boolean extraDetail = activity.getSharedPreferences("bh_prefs", 0)
                    .getBoolean("hud_extra_detail", false);

            Log.d(TAG, "BhHudInjector.injectOrUpdate: hudEnabled=" + hudEnabled
                    + " extraDetail=" + extraDetail);

            // ── Normal HUD ────────────────────────────────────────────────────
            View existingNormal = container.findViewWithTag("bh_frame_rating");
            boolean showNormal = hudEnabled && !extraDetail;

            if (existingNormal == null) {
                if (showNormal) {
                    BhFrameRating hud = new BhFrameRating(activity);
                    hud.setTag("bh_frame_rating");
                    FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                            FrameLayout.LayoutParams.WRAP_CONTENT,
                            FrameLayout.LayoutParams.WRAP_CONTENT,
                            android.view.Gravity.TOP | android.view.Gravity.END);
                    hud.setVisibility(View.VISIBLE);
                    container.addView(hud, lp);
                    hud.bringToFront();
                    Log.d(TAG, "BhHudInjector: normal HUD injected");
                }
            } else {
                existingNormal.setVisibility(showNormal ? View.VISIBLE : View.GONE);
                if (showNormal) existingNormal.bringToFront();
            }

            // ── Detailed HUD ──────────────────────────────────────────────────
            View existingDetail = container.findViewWithTag("bh_detailed_hud");
            boolean showDetail = hudEnabled && extraDetail;

            if (existingDetail == null) {
                if (showDetail) {
                    BhDetailedHud hud = new BhDetailedHud(activity);
                    hud.setTag("bh_detailed_hud");
                    FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                            FrameLayout.LayoutParams.WRAP_CONTENT,
                            FrameLayout.LayoutParams.WRAP_CONTENT,
                            android.view.Gravity.TOP | android.view.Gravity.END);
                    hud.setVisibility(View.VISIBLE);
                    container.addView(hud, lp);
                    hud.bringToFront();
                    Log.d(TAG, "BhHudInjector: detailed HUD injected");
                }
            } else {
                existingDetail.setVisibility(showDetail ? View.VISIBLE : View.GONE);
                if (showDetail) existingDetail.bringToFront();
            }

        } catch (Exception e) {
            Log.e(TAG, "BhHudInjector.injectOrUpdate failed", e);
        }
    }
}
