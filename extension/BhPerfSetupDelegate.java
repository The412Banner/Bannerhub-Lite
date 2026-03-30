package app.revanced.extension.gamehub;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.LinearLayout;

import java.lang.reflect.Constructor;
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

            // ── Winlator HUD toggle (added programmatically) ──────────────────
            View hudSwitch = parentView.findViewWithTag("bh_hud_switch");
            if (hudSwitch == null) {
                hudSwitch = createSidebarSwitch(ctx);
                if (hudSwitch != null) {
                    hudSwitch.setTag("bh_hud_switch");
                    setTextOnSwitch(hudSwitch, "Winlator HUD");
                    if (parentView instanceof ViewGroup) {
                        ((ViewGroup) parentView).addView(hudSwitch,
                                new LinearLayout.LayoutParams(
                                        LinearLayout.LayoutParams.MATCH_PARENT,
                                        LinearLayout.LayoutParams.WRAP_CONTENT));
                    }
                }
            }
            if (hudSwitch != null) {
                boolean hudEnabled = prefs.getBoolean("winlator_hud", false);
                callSetSwitch(hudSwitch, hudEnabled);
                final View finalHudSwitch = hudSwitch;
                hudSwitch.setOnClickListener(v -> toggleHud(ctx, prefs, finalHudSwitch));
            }
        } catch (Exception e) {
            Log.e(TAG, "BhPerfSetupDelegate.onAttachedToWindow failed", e);
        }
    }

    // ── Toggle: Winlator HUD ───────────────────────────────────────────────────

    private static void toggleHud(Context ctx, SharedPreferences prefs, View switchView) {
        try {
            boolean newState = !callGetSwitchState(switchView);
            callSetSwitch(switchView, newState);
            prefs.edit().putBoolean("winlator_hud", newState).apply();

            // Sync running HUD if WineActivity is available
            try {
                Class<?> wineClass = Class.forName("com.xj.winemu.WineActivity");
                Activity activity = (Activity) wineClass.getField("t1").get(null);
                if (activity != null) {
                    BhHudInjector.injectOrUpdate(activity);
                }
            } catch (Exception ignored) {}
        } catch (Exception e) {
            Log.e(TAG, "toggleHud failed", e);
        }
    }

    // ── SidebarSwitchItemView creation helpers ─────────────────────────────────

    private static View createSidebarSwitch(Context ctx) {
        try {
            Class<?> cls = Class.forName("com.xj.winemu.view.SidebarSwitchItemView");
            Constructor<?> ctor = cls.getConstructor(Context.class, android.util.AttributeSet.class);
            return (View) ctor.newInstance(ctx, null);
        } catch (Exception e) {
            Log.w(TAG, "createSidebarSwitch failed: " + e.getMessage());
            return null;
        }
    }

    private static void setTextOnSwitch(View view, String text) {
        try {
            // SidebarSwitchItemView.j = WinemuSidebarSwitchItemBinding; binding.titleText or first TextView
            java.lang.reflect.Field jField = view.getClass().getField("j");
            Object binding = jField.get(view);
            if (binding == null) return;
            // Try common field names for the title TextView
            for (String name : new String[]{"titleText", "title", "tvTitle", "a"}) {
                try {
                    java.lang.reflect.Field f = binding.getClass().getDeclaredField(name);
                    f.setAccessible(true);
                    Object tv = f.get(binding);
                    if (tv instanceof android.widget.TextView) {
                        ((android.widget.TextView) tv).setText(text);
                        return;
                    }
                } catch (NoSuchFieldException ignored) {}
            }
        } catch (Exception e) {
            Log.w(TAG, "setTextOnSwitch failed: " + e.getMessage());
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
