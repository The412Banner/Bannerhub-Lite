package app.revanced.extension.gamehub;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import java.lang.reflect.Constructor;
import java.util.List;

/**
 * Static helpers called from smali code injected into GameHub Lite 5.1.4.
 *
 * Injection points:
 *   - HomeLeftMenuDialog.Z0() → addComponentsMenuItem(List)
 *   - HomeLeftMenuDialog$init$1$9$2.a(MenuItem) → handleMenuItemClick(...)
 *   - LandscapeLauncherMainActivity.initView() → setupBciButton(Activity)
 */
@SuppressWarnings("unused")
public final class ComponentManagerHelper {

    private static final String TAG = "BannerHub";
    private static final int COMPONENTS_MENU_ID = 9;
    private static final int GOG_MENU_ID = 10;
    private static final int AMAZON_MENU_ID = 11;
    private static final int EPIC_MENU_ID = 12;

    private ComponentManagerHelper() {}

    // ── Called from HomeLeftMenuDialog.Z0() ──────────────────────────────────

    @SuppressWarnings("rawtypes")
    public static void addComponentsMenuItem(Object dialog, List items) {
        Log.d(TAG, "addComponentsMenuItem called");
        try {
            // Get context from the dialog fragment (public API, no hidden API needed)
            Context ctx = (Context) dialog.getClass().getMethod("getContext").invoke(dialog);

            Class<?> menuItemClass = Class.forName(
                    "com.xj.landscape.launcher.ui.menu.HomeLeftMenuDialog$MenuItem");
            Class<?> markerClass = Class.forName(
                    "kotlin.jvm.internal.DefaultConstructorMarker");

            // 5.1.4 constructor: <init>(int id, int iconRes, String name,
            //                           String rightContent, int mask, DefaultConstructorMarker)
            Constructor<?> ctor = menuItemClass.getDeclaredConstructor(
                    int.class, int.class, String.class, String.class,
                    int.class, markerClass);
            ctor.setAccessible(true);

            int iconRes = ctx.getResources().getIdentifier(
                    "menu_setting_normal", "drawable", ctx.getPackageName());

            // mask=0x8: bit3 set → rightContent uses Kotlin default ("")
            Object item = ctor.newInstance(
                    COMPONENTS_MENU_ID, iconRes, "Components", null, 0x8, null);
            //noinspection unchecked
            items.add(item);
            Log.d(TAG, "addComponentsMenuItem: Components item added (id=" + COMPONENTS_MENU_ID + ")");

            Object gogItem = ctor.newInstance(
                    GOG_MENU_ID, iconRes, "GOG Games", null, 0x8, null);
            //noinspection unchecked
            items.add(gogItem);
            Log.d(TAG, "addComponentsMenuItem: GOG item added (id=" + GOG_MENU_ID + ")");

            Object amazonItem = ctor.newInstance(
                    AMAZON_MENU_ID, iconRes, "Amazon Games", null, 0x8, null);
            //noinspection unchecked
            items.add(amazonItem);
            Log.d(TAG, "addComponentsMenuItem: Amazon item added (id=" + AMAZON_MENU_ID + ")");

            Object epicItem = ctor.newInstance(
                    EPIC_MENU_ID, iconRes, "Epic Games", null, 0x8, null);
            //noinspection unchecked
            items.add(epicItem);
            Log.d(TAG, "addComponentsMenuItem: Epic item added (id=" + EPIC_MENU_ID + ")");
        } catch (Exception e) {
            Log.e(TAG, "addComponentsMenuItem failed", e);
        }
    }

    // ── Called from HomeLeftMenuDialog$init$1$9$2.a(MenuItem) ────────────────

    public static boolean handleMenuItemClick(Object dialog, Object menuItem, Activity activity) {
        Log.d(TAG, "handleMenuItemClick called");
        try {
            int id = (int) menuItem.getClass().getMethod("a").invoke(menuItem);

            if (id == COMPONENTS_MENU_ID) {
                dialog.getClass().getMethod("dismiss").invoke(dialog);
                Intent intent = new Intent(activity, ComponentManagerActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                activity.startActivity(intent);
                return true;
            }

            if (id == GOG_MENU_ID) {
                dialog.getClass().getMethod("dismiss").invoke(dialog);
                Intent intent = new Intent(activity, GogMainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                activity.startActivity(intent);
                return true;
            }

            if (id == AMAZON_MENU_ID) {
                dialog.getClass().getMethod("dismiss").invoke(dialog);
                Intent intent = new Intent(activity, AmazonMainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                activity.startActivity(intent);
                return true;
            }

            if (id == EPIC_MENU_ID) {
                dialog.getClass().getMethod("dismiss").invoke(dialog);
                Intent intent = new Intent(activity, EpicMainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                activity.startActivity(intent);
                return true;
            }

            return false;
        } catch (Exception e) {
            Log.e(TAG, "handleMenuItemClick failed", e);
            return false;
        }
    }

    // ── Called from LandscapeLauncherMainActivity.initView() ─────────────────

    /**
     * Finds the BCI launcher button (iv_bci_launcher) in the top-right toolbar
     * and wires it to open BannersComponentInjector (com.banner.inject).
     * Falls back to ComponentManagerActivity if BCI is not installed.
     */
    public static void setupBciButton(Activity activity) {
        Log.d(TAG, "setupBciButton called");
        try {
            int id = activity.getResources().getIdentifier(
                    "iv_bci_launcher", "id", activity.getPackageName());
            if (id == 0) return;

            View bciButton = activity.findViewById(id);
            if (bciButton == null) return;

            bciButton.setOnClickListener(v -> {
                Context ctx = v.getContext();
                android.content.pm.PackageManager pm = ctx.getPackageManager();
                Intent launch = pm.getLaunchIntentForPackage("com.banner.inject");
                if (launch != null) {
                    ctx.startActivity(launch);
                } else {
                    Toast.makeText(ctx,
                            "BannersComponentInjector not installed",
                            Toast.LENGTH_SHORT).show();
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "setupBciButton failed", e);
        }
    }
}
