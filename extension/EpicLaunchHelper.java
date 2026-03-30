package app.revanced.extension.gamehub;

import android.app.Activity;
import android.content.SharedPreferences;
import android.util.Log;

/**
 * Bridges EpicGamesActivity back to LandscapeLauncherMainActivity so that
 * EditImportedGameInfoDialog is fired automatically after an Epic game installs.
 *
 * Flow:
 *   1. EpicGamesActivity.pendingLaunchExe() saves pending_epic_exe to bh_epic_prefs
 *      and starts LandscapeLauncherMainActivity (CLEAR_TOP | SINGLE_TOP)
 *   2. LandscapeLauncherMainActivity.onResume() calls checkPendingLaunch(activity)
 *      → reads pending_epic_exe, invokes g3(exePath) via reflection, clears pref
 */
public final class EpicLaunchHelper {

    private static final String TAG = "BH_EPIC";

    private EpicLaunchHelper() {}

    /**
     * Called from LandscapeLauncherMainActivity.onResume() via smali injection.
     * If a pending Epic exe path is stored, invokes g3(exePath) to open
     * EditImportedGameInfoDialog with the path pre-filled, then clears the pref.
     */
    public static void checkPendingLaunch(Activity activity) {
        SharedPreferences prefs = activity.getSharedPreferences("bh_epic_prefs", 0);
        String exe = prefs.getString("pending_epic_exe", null);
        if (exe == null || exe.isEmpty()) return;

        prefs.edit().remove("pending_epic_exe").apply();
        try {
            activity.getClass().getMethod("g3", String.class).invoke(activity, exe);
            Log.d(TAG, "EpicLaunchHelper: g3 called with " + exe);
        } catch (Exception e) {
            Log.e(TAG, "EpicLaunchHelper: g3 call failed", e);
        }
    }
}
