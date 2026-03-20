package app.revanced.extension.gamehub;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

/**
 * BannerHub Lite — Root Grant Helper.
 *
 * Called from the Settings → Advanced "Grant Root Access" button.
 * Shows a detailed warning dialog, then on user confirmation runs "su -c id"
 * to trigger the root manager prompt. On success, stores root_granted=true in
 * bh_prefs so BhPerfSetupDelegate can enable performance toggles on next open.
 */
@SuppressWarnings("unused")
public class BhRootGrantHelper {

    private static final String TAG = "BannerHub";

    public static void requestRoot(Context ctx) {
        if (ctx == null) return;

        SharedPreferences prefs = ctx.getSharedPreferences("bh_prefs", Context.MODE_PRIVATE);
        boolean alreadyGranted = prefs.getBoolean("root_granted", false);

        AlertDialog.Builder builder = new AlertDialog.Builder(ctx);
        builder.setCancelable(true);

        if (alreadyGranted) {
            builder.setTitle("Root Access — Performance Controls");
            builder.setMessage(
                "Root access is currently GRANTED for BannerHub Lite performance controls.\n\n" +
                "This allows the in-game Performance sidebar to:\n" +
                "  \u2022 Enable Sustained Performance Mode\n" +
                "  \u2022 Lock Adreno GPU clocks to maximum\n\n" +
                "Tap 'Revoke Access' to withdraw this permission and grey out the " +
                "performance toggles, or 'Keep' to leave it active."
            );
            builder.setPositiveButton("Revoke Access", (dialog, which) -> {
                prefs.edit().putBoolean("root_granted", false).apply();
                Toast.makeText(ctx,
                    "Root access revoked. Performance controls are now disabled.",
                    Toast.LENGTH_LONG).show();
            });
            builder.setNegativeButton("Keep", (dialog, which) -> dialog.dismiss());
        } else {
            builder.setTitle("\u26a0 Grant Root Access — Read Carefully");
            builder.setMessage(
                "BannerHub Lite can use root (superuser) access to enable advanced " +
                "performance controls in the in-game Performance sidebar.\n\n" +
                "Once granted, you will be able to:\n" +
                "  \u2022 Sustained Performance Mode — locks CPU/GPU clocks at a stable " +
                    "level to reduce thermal throttling during long gaming sessions.\n" +
                "  \u2022 Max Adreno GPU Clocks — forces the Adreno GPU minimum frequency " +
                    "to its maximum value for peak frame rates.\n\n" +
                "\u26a0 IMPORTANT WARNINGS:\n\n" +
                "1. Your root manager (Magisk, KernelSU, etc.) will show a separate " +
                    "permission prompt — you must tap GRANT there as well.\n\n" +
                "2. Granting root exposes your device at the superuser level. Only " +
                    "proceed if you trust this application and understand what root access means.\n\n" +
                "3. 'Max Adreno Clocks' requires a Qualcomm Adreno GPU and the " +
                    "kgsl-3d0 sysfs node. On other devices it will silently have no effect.\n\n" +
                "4. These toggles modify live kernel parameters. Effects are reset on " +
                    "reboot. They do not permanently alter your device.\n\n" +
                "5. Sustained Performance Mode increases battery consumption and device " +
                    "temperature during use.\n\n" +
                "Tap 'Grant Access' to proceed and trigger your root manager's prompt."
            );
            builder.setPositiveButton("Grant Access", (dialog, which) -> {
                new Thread(() -> {
                    try {
                        Process p = Runtime.getRuntime().exec(new String[]{"su", "-c", "id"});
                        int exit = p.waitFor();
                        p.destroy();
                        boolean granted = (exit == 0);
                        prefs.edit().putBoolean("root_granted", granted).apply();
                        new Handler(Looper.getMainLooper()).post(() -> {
                            if (granted) {
                                Toast.makeText(ctx,
                                    "Root access granted! Open the in-game Performance menu to activate controls.",
                                    Toast.LENGTH_LONG).show();
                            } else {
                                Toast.makeText(ctx,
                                    "Root access was denied or is not available on this device.",
                                    Toast.LENGTH_LONG).show();
                            }
                        });
                    } catch (Exception e) {
                        Log.e(TAG, "BhRootGrantHelper: su exec failed", e);
                    }
                }).start();
            });
            builder.setNegativeButton("Cancel", (dialog, which) -> dialog.dismiss());
        }

        builder.show();
    }
}
