package app.revanced.extension.gamehub;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewParent;
import android.widget.CheckBox;
import android.widget.SeekBar;
import android.widget.TextView;

import java.lang.reflect.Method;

/**
 * BannerHub Lite — Performance Setup Delegate.
 *
 * Inflated as a zero-size invisible View inside winemu_sidebar_controls_fragment.xml.
 * On onAttachedToWindow(), locates sibling SidebarSwitchItemView instances
 * (switch_sustained_perf and switch_max_adreno_clocks) inside the same parent
 * LinearLayout and wires up their click listeners.
 *
 * Root check: if "su -c id" returns non-zero, toggles are greyed out at 50% alpha
 * with no click listener.
 *
 * Port of BhPerfSetupDelegate from BannerHub 5.3.5 into Java (for 5.1.4 dex injection).
 */
@SuppressWarnings("unused")
public class BhPerfSetupDelegate extends View {

    private static final String TAG = "BannerHub";

    public BhPerfSetupDelegate(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        try {
            ViewParent parent = getParent();
            if (!(parent instanceof View)) return;
            View parentView = (View) parent;

            Context ctx = getContext();
            if (ctx == null) return;

            SharedPreferences prefs = ctx.getSharedPreferences("bh_prefs", Context.MODE_PRIVATE);
            // BannerHub Lite: root is requested explicitly via Settings → Advanced → Grant Root Access.
            // Reading prefs avoids triggering the su popup every time this menu is opened.
            boolean hasRoot = prefs.getBoolean("root_granted", false);

            int sustainedId = ctx.getResources().getIdentifier(
                    "switch_sustained_perf", "id", ctx.getPackageName());
            int adrenoId = ctx.getResources().getIdentifier(
                    "switch_max_adreno_clocks", "id", ctx.getPackageName());

            View sustainedSwitch = parentView.findViewById(sustainedId);
            View adrenoSwitch = parentView.findViewById(adrenoId);

            if (sustainedSwitch != null) {
                boolean enabled = prefs.getBoolean("sustained_perf", false);
                callSetSwitch(sustainedSwitch, enabled);

                if (hasRoot) {
                    sustainedSwitch.setOnClickListener(v -> toggleSustainedPerf(ctx, prefs, v));
                } else {
                    sustainedSwitch.setAlpha(0.5f);
                }
            }

            if (adrenoSwitch != null) {
                boolean enabled = prefs.getBoolean("max_adreno_clocks", false);
                callSetSwitch(adrenoSwitch, enabled);

                if (hasRoot) {
                    adrenoSwitch.setOnClickListener(v -> toggleMaxAdreno(ctx, prefs, v));
                } else {
                    adrenoSwitch.setAlpha(0.5f);
                }
            }

            // ── Winlator HUD toggle ───────────────────────────────────────────
            int hudId = ctx.getResources().getIdentifier(
                    "switch_winlator_hud", "id", ctx.getPackageName());
            int opacityRowId = ctx.getResources().getIdentifier(
                    "hud_opacity_row", "id", ctx.getPackageName());
            int opacityLabelId = ctx.getResources().getIdentifier(
                    "hud_opacity_label", "id", ctx.getPackageName());
            int opacitySeekId = ctx.getResources().getIdentifier(
                    "hud_opacity_seekbar", "id", ctx.getPackageName());

            View hudSwitch = parentView.findViewById(hudId);
            View opacityRow = parentView.findViewById(opacityRowId);
            Log.d(TAG, "BhPerfSetupDelegate: hudId=" + hudId + " hudSwitch=" + hudSwitch);
            if (hudSwitch != null) {
                boolean hudEnabled = prefs.getBoolean("winlator_hud", false);
                callSetSwitch(hudSwitch, hudEnabled);
                if (opacityRow != null) {
                    opacityRow.setVisibility(hudEnabled ? View.VISIBLE : View.GONE);
                }
                hudSwitch.setOnClickListener(v -> toggleHud(ctx, prefs, v, opacityRow, parentView));
                Log.d(TAG, "BhPerfSetupDelegate: HUD click listener set");
            }

            // ── Extra Detail checkbox ─────────────────────────────────────────
            int extraDetailId = ctx.getResources().getIdentifier(
                    "check_hud_extra_detail", "id", ctx.getPackageName());
            View extraDetailView = parentView.findViewById(extraDetailId);
            if (extraDetailView instanceof CheckBox) {
                CheckBox cbDetail = (CheckBox) extraDetailView;
                boolean detailEnabled = prefs.getBoolean("hud_extra_detail", false);
                cbDetail.setChecked(detailEnabled);
                cbDetail.setEnabled(hudEnabled);
                cbDetail.setAlpha(hudEnabled ? 1f : 0.4f);
                cbDetail.setOnCheckedChangeListener((cb, checked) -> {
                    prefs.edit().putBoolean("hud_extra_detail", checked).apply();
                    Activity activity = (ctx instanceof Activity) ? (Activity) ctx : null;
                    if (activity != null) BhHudInjector.injectOrUpdate(activity);
                });
            }

            // ── HUD Opacity SeekBar ──────────────────────────────────────────
            if (opacityRow != null) {
                TextView label = opacityRow.findViewById(opacityLabelId);
                SeekBar seek = opacityRow.findViewById(opacitySeekId);
                if (seek != null) {
                    int savedOpacity = prefs.getInt("hud_opacity", 80);
                    seek.setProgress(savedOpacity);
                    if (label != null) label.setText("HUD Opacity: " + savedOpacity + "%");
                    seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                        @Override public void onProgressChanged(SeekBar sb, int progress, boolean fromUser) {
                            if (!fromUser) return;
                            prefs.edit().putInt("hud_opacity", progress).apply();
                            if (label != null) label.setText("HUD Opacity: " + progress + "%");
                            applyHudOpacity(ctx, progress);
                        }
                        @Override public void onStartTrackingTouch(SeekBar sb) {}
                        @Override public void onStopTrackingTouch(SeekBar sb) {}
                    });
                }
            }
        } catch (Exception e) {
            Log.e(TAG, "BhPerfSetupDelegate.onAttachedToWindow failed", e);
        }
    }

    // ── Toggle: Winlator HUD ───────────────────────────────────────────────────

    private static void toggleHud(Context ctx, SharedPreferences prefs, View switchView,
                                   View opacityRow, View parentView) {
        try {
            boolean newState = !callGetSwitchState(switchView);
            Log.d(TAG, "toggleHud: newState=" + newState + " ctx=" + ctx.getClass().getSimpleName());
            callSetSwitch(switchView, newState);
            prefs.edit().putBoolean("winlator_hud", newState).apply();

            if (opacityRow != null) {
                opacityRow.setVisibility(newState ? View.VISIBLE : View.GONE);
            }

            // Enable/disable Extra Detail checkbox based on HUD state
            if (parentView != null) {
                int extraDetailId = ctx.getResources().getIdentifier(
                        "check_hud_extra_detail", "id", ctx.getPackageName());
                View cbView = parentView.findViewById(extraDetailId);
                if (cbView instanceof CheckBox) {
                    cbView.setEnabled(newState);
                    cbView.setAlpha(newState ? 1f : 0.4f);
                }
            }

            // ctx IS the host Activity (Fragment context = host WineActivity)
            Activity activity = (ctx instanceof Activity) ? (Activity) ctx : null;
            if (activity != null) {
                BhHudInjector.injectOrUpdate(activity);
            } else {
                Log.w(TAG, "toggleHud: ctx is not an Activity — " + ctx.getClass().getName());
            }
        } catch (Exception e) {
            Log.e(TAG, "toggleHud failed", e);
        }
    }

    private static void applyHudOpacity(Context ctx, int opacity) {
        try {
            Activity activity = (ctx instanceof Activity) ? (Activity) ctx : null;
            if (activity == null) return;
            android.view.View contentView = activity.getWindow().getDecorView()
                    .findViewById(android.R.id.content);
            if (!(contentView instanceof android.view.ViewGroup)) return;
            android.view.View hud = ((android.view.ViewGroup) contentView)
                    .findViewWithTag("bh_frame_rating");
            if (hud instanceof BhFrameRating) {
                ((BhFrameRating) hud).applyBackgroundOpacity(opacity);
            }
        } catch (Exception e) {
            Log.w(TAG, "applyHudOpacity failed: " + e.getMessage());
        }
    }

    // ── Toggle: Sustained Performance ─────────────────────────────────────────

    private static void toggleSustainedPerf(Context ctx, SharedPreferences prefs, View switchView) {
        try {
            boolean newState = !callGetSwitchState(switchView);
            callSetSwitch(switchView, newState);
            prefs.edit().putBoolean("sustained_perf", newState).apply();

            // setSustainedPerformanceMode via WineActivity singleton
            try {
                Class<?> wineClass = Class.forName("com.xj.winemu.WineActivity");
                Activity activity = (Activity) wineClass.getField("t1").get(null);
                if (activity != null) {
                    activity.getWindow().setSustainedPerformanceMode(newState);
                }
            } catch (Exception e) {
                Log.w(TAG, "setSustainedPerformanceMode failed: " + e.getMessage());
            }

            // Also CPU governor via su -c
            String cmd = newState
                    ? "for f in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do echo performance > $f; done"
                    : "for f in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do echo schedutil > $f; done";
            Runtime.getRuntime().exec(new String[]{"su", "-c", cmd});
        } catch (Exception e) {
            Log.e(TAG, "toggleSustainedPerf failed", e);
        }
    }

    // ── Toggle: Max Adreno Clocks ──────────────────────────────────────────────

    private static void toggleMaxAdreno(Context ctx, SharedPreferences prefs, View switchView) {
        try {
            boolean newState = !callGetSwitchState(switchView);
            callSetSwitch(switchView, newState);
            prefs.edit().putBoolean("max_adreno_clocks", newState).apply();

            String cmd = newState
                    ? "cat /sys/class/kgsl/kgsl-3d0/devfreq/max_freq > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq"
                    : "echo 0 > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq";
            Runtime.getRuntime().exec(new String[]{"su", "-c", cmd});
        } catch (Exception e) {
            Log.e(TAG, "toggleMaxAdreno failed", e);
        }
    }

    // ── SidebarSwitchItemView reflection helpers ───────────────────────────────

    private static boolean callGetSwitchState(View view) {
        try {
            Method m = view.getClass().getMethod("getSwitchState");
            return (boolean) m.invoke(view);
        } catch (Exception e) {
            Log.w(TAG, "getSwitchState reflection failed: " + e.getMessage());
            return false;
        }
    }

    private static void callSetSwitch(View view, boolean state) {
        try {
            Method m = view.getClass().getMethod("setSwitch", boolean.class);
            m.invoke(view, state);
        } catch (Exception e) {
            Log.w(TAG, "setSwitch reflection failed: " + e.getMessage());
        }
    }

    // ── Root check ────────────────────────────────────────────────────────────

    public static boolean isRootAvailable() {
        try {
            Process p = Runtime.getRuntime().exec(new String[]{"su", "-c", "id"});
            int exit = p.waitFor();
            p.destroy();
            return exit == 0;
        } catch (Exception e) {
            return false;
        }
    }
}
