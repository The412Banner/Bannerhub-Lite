package app.revanced.extension.gamehub;

import android.app.Activity;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

/**
 * Injects / syncs BhFrameRating (Winlator HUD overlay) into WineActivity's DecorView.
 * Called from WineActivity.onResume() via smali injection in build-quick.yml.
 */
public final class BhHudInjector {

    private static final String TAG = "BannerHub";

    private BhHudInjector() {}

    /**
     * Call from WineActivity.onResume().
     * - Reads "winlator_hud" boolean from bh_prefs.
     * - Finds existing BhFrameRating by tag "bh_frame_rating" in DecorView.
     * - If not found + HUD enabled: creates and adds it (TOP|RIGHT, WRAP_CONTENT).
     * - If found: syncs visibility (VISIBLE / GONE) with current pref.
     */
    public static void injectOrUpdate(Activity activity) {
        if (activity == null) return;
        try {
            android.view.Window window = activity.getWindow();
            if (window == null) return;

            // Use content view (android.R.id.content) — sits above SurfaceView in Z-order
            View contentView = window.getDecorView().findViewById(android.R.id.content);
            if (!(contentView instanceof ViewGroup)) return;
            ViewGroup container = (ViewGroup) contentView;

            boolean hudEnabled = activity.getSharedPreferences("bh_prefs", 0)
                    .getBoolean("winlator_hud", false);

            Log.d(TAG, "BhHudInjector.injectOrUpdate: hudEnabled=" + hudEnabled
                    + " container=" + container.getClass().getSimpleName());

            View existing = container.findViewWithTag("bh_frame_rating");

            if (existing == null) {
                if (!hudEnabled) {
                    Log.d(TAG, "BhHudInjector: HUD disabled, nothing to do");
                    return;
                }

                BhFrameRating hud = new BhFrameRating(activity);
                hud.setTag("bh_frame_rating");

                // TOP | RIGHT gravity; bringToFront ensures it's above other views
                FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                        FrameLayout.LayoutParams.WRAP_CONTENT,
                        FrameLayout.LayoutParams.WRAP_CONTENT,
                        android.view.Gravity.TOP | android.view.Gravity.END);
                hud.setVisibility(View.VISIBLE);
                container.addView(hud, lp);
                hud.bringToFront();
                Log.d(TAG, "BhHudInjector: HUD injected into "
                        + container.getClass().getSimpleName());
            } else {
                existing.setVisibility(hudEnabled ? View.VISIBLE : View.GONE);
                if (hudEnabled) existing.bringToFront();
                Log.d(TAG, "BhHudInjector: HUD visibility=" + hudEnabled);
            }
        } catch (Exception e) {
            Log.e(TAG, "BhHudInjector.injectOrUpdate failed", e);
        }
    }
}
