package com.xj.winemu.sidebar;

import android.content.Context;
import android.view.View;

import java.lang.reflect.Method;

/**
 * Wires the Frame Generation switch + gear button added to the in-game
 * sidebar (winemu_sidebar_controls_fragment.xml) to BhFrameGenWriter +
 * BhFrameGenDialog.
 *
 * Called from SidebarControlsFragment.onResume() via a smali patch that
 * invokes Fragment.getView() and passes the resulting View here.
 *
 * Gear button visibility follows the same pattern as RTS touch controls:
 * hidden by default in XML, shown only when the switch is ON.
 *
 * SidebarSwitchItemView is a custom Kotlin view (com.xj.winemu.view.*) that
 * renders the switch as an ImageView, not a real CompoundButton — so we drive
 * it through its public setSwitch(boolean) method via reflection.
 */
public class BhFrameGenWiring {

    private static View viewById(View root, String idName) {
        Context ctx = root.getContext();
        int id = ctx.getResources().getIdentifier(idName, "id", ctx.getPackageName());
        if (id == 0) return null;
        return root.findViewById(id);
    }

    /** Smali-friendly wrapper: invoked from SidebarControlsFragment.onResume()
     *  with `this`. Resolves Fragment.getView() reflectively so this extension
     *  doesn't need androidx on its compile classpath. */
    public static void bindFromFragment(Object frag) {
        if (frag == null) return;
        try {
            Method getView = frag.getClass().getMethod("getView");
            Object v = getView.invoke(frag);
            if (v instanceof View) bind((View) v);
        } catch (Throwable ignored) {}
    }

    /** Bind switch + gear button. Idempotent — onResume can call repeatedly.
     *  Gear visibility mirrors RTS pattern: gone by default, visible only when ON. */
    public static void bind(final View root) {
        if (root == null) return;
        final Context ctx = root.getContext();

        final View gearButton = viewById(root, "btn_frame_gen_settings");
        final View switchView = viewById(root, "switch_frame_gen");

        if (switchView != null) {
            BhFrameGenSettings settings = BhFrameGenSettings.load(ctx);

            // Sync switch state
            invokeSetSwitch(switchView, settings.enabled);

            // Sync gear visibility based on current state (RTS pattern)
            if (gearButton != null) {
                gearButton.setVisibility(settings.enabled ? View.VISIBLE : View.GONE);
                gearButton.setOnClickListener(v -> BhFrameGenDialog.show(ctx));
            }

            // Click handler — toggle state and update gear visibility
            switchView.setOnClickListener(v -> {
                BhFrameGenSettings s = BhFrameGenSettings.load(ctx);
                boolean newState = !s.enabled;
                s.enabled = newState;
                invokeSetSwitch(v, newState);
                BhFrameGenWriter.writeEnabled(BhFrameGenWriter.resolveControlPath(ctx), newState);
                s.save(ctx);
                // Show/hide gear exactly as RTS does
                if (gearButton != null) {
                    gearButton.setVisibility(newState ? View.VISIBLE : View.GONE);
                }
            });
        }
    }

    private static void invokeSetSwitch(View view, boolean value) {
        try {
            Method m = view.getClass().getMethod("setSwitch", boolean.class);
            m.invoke(view, value);
        } catch (Throwable ignored) {}
    }
}
