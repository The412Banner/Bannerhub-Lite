package com.xj.winemu.sidebar;

import android.content.Context;
import android.view.View;

import java.lang.reflect.Method;

/**
 * Wires the GameScope Driver click item added to the Performance sidebar
 * (winemu_sidebar_hub_type_fragment.xml) to GpuDriverSelectHelper.
 *
 * Called from SidebarPerformanceFragment.onResume() via smali patch.
 * Pattern mirrors BhFrameGenWiring — resolves Fragment.getView() reflectively.
 */
public class BhVulkanDriverWiring {

    /** Smali-friendly wrapper: invoked from SidebarPerformanceFragment.onResume(). */
    public static void bindFromFragment(Object frag) {
        if (frag == null) return;
        try {
            Method getView = frag.getClass().getMethod("getView");
            Object v = getView.invoke(frag);
            if (v instanceof View) bind((View) v);
        } catch (Throwable ignored) {}
    }

    /** Bind click listener to GameScope Driver item. Idempotent. */
    public static void bind(final View root) {
        if (root == null) return;
        final Context ctx = root.getContext();

        View item = viewById(root, "gamescope_driver_item");
        if (item == null) return;

        item.setOnClickListener(v ->
                app.revanced.extension.gamehub.GpuDriverSelectHelper.show(ctx));
    }

    private static View viewById(View root, String idName) {
        Context ctx = root.getContext();
        int id = ctx.getResources().getIdentifier(idName, "id", ctx.getPackageName());
        if (id == 0) return null;
        return root.findViewById(id);
    }
}
