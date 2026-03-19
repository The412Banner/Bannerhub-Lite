package app.revanced.extension.gamehub;

import android.app.AlertDialog;
import android.content.Context;
import android.text.Html;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * BannerHub Lite: CPU core multi-select dialog.
 *
 * Ported from BannerHub (5.3.5) CpuMultiSelectHelper.smali.
 * Invoked from SelectAndSingleInputDialog$Companion.f() when
 * contentType == CONTENT_TYPE_CORE_LIMIT (patch 14 in build workflow).
 *
 * Uses reflection to call 5.1.4 obfuscated methods:
 *   PcGameSettingDataHelper.a           (singleton field)
 *   PcGameSettingDataHelper.w(String)   (get PcGameSettingOperations)
 *   PcGameSettingOperations.h0()        (get SPUtils)
 *   PcGameSettingDataHelper.C(helper, type, null, 2, null) (get prefs key)
 *   PcGameSettingOperations.H(ops, 0, 1, null)             (read stored bitmask)
 *   SPUtils.m(String, int)              (write preference)
 */
public class CpuMultiSelectHelper {

    public static void show(View anchor, String gameId, int contentType, Object callback) {
        try {
            Context ctx = anchor.getContext();

            Class<?> dataHelperClass = Class.forName("com.xj.winemu.settings.PcGameSettingDataHelper");
            Class<?> opsClass       = Class.forName("com.xj.winemu.settings.PcGameSettingOperations");
            Class<?> spClass        = Class.forName("com.blankj.utilcode.util.SPUtils");

            Field helperField = dataHelperClass.getField("a");
            Object helper = helperField.get(null);

            // PcGameSettingOperations ops = helper.w(gameId)
            Object ops = dataHelperClass.getMethod("w", String.class).invoke(helper, gameId);

            // SPUtils sp = ops.h0()
            Object spUtils = opsClass.getMethod("h0").invoke(ops);

            // String key = PcGameSettingDataHelper.C(helper, contentType, null, 2, null)
            String key = (String) dataHelperClass
                    .getMethod("C", dataHelperClass, int.class, String.class, int.class, Object.class)
                    .invoke(null, helper, contentType, null, 2, null);

            // int currentMask = PcGameSettingOperations.H(ops, 0, 1, null)
            int currentMask = (Integer) opsClass
                    .getMethod("H", opsClass, int.class, int.class, Object.class)
                    .invoke(null, ops, 0, 1, null);

            Method writeMethod = spClass.getMethod("m", String.class, int.class);

            CharSequence[] labels = new CharSequence[8];
            labels[0] = Html.fromHtml("<small>Core 0 (Efficiency)</small>", 0);
            labels[1] = Html.fromHtml("<small>Core 1 (Efficiency)</small>", 0);
            labels[2] = Html.fromHtml("<small>Core 2 (Efficiency)</small>", 0);
            labels[3] = Html.fromHtml("<small>Core 3 (Efficiency)</small>", 0);
            labels[4] = Html.fromHtml("<small>Core 4 (Performance)</small>", 0);
            labels[5] = Html.fromHtml("<small>Core 5 (Performance)</small>", 0);
            labels[6] = Html.fromHtml("<small>Core 6 (Performance)</small>", 0);
            labels[7] = Html.fromHtml("<small>Core 7 (Prime)</small>", 0);

            boolean[] checked = new boolean[8];
            for (int i = 0; i < 8; i++) {
                checked[i] = (currentMask & (1 << i)) != 0;
            }

            AlertDialog.Builder builder = new AlertDialog.Builder(ctx);
            builder.setTitle("CPU Core Limit");
            builder.setMultiChoiceItems(labels, checked,
                    (dialog, which, isChecked) -> checked[which] = isChecked);
            builder.setPositiveButton("Apply", (dialog, which) -> {
                int newMask = 0;
                for (int i = 0; i < 8; i++) {
                    if (checked[i]) newMask |= (1 << i);
                }
                if (newMask == 0) {
                    Toast.makeText(ctx, "Select at least one core", Toast.LENGTH_SHORT).show();
                    return;
                }
                if (newMask == 0xFF) newMask = 0;  // all cores = No Limit
                try {
                    writeMethod.invoke(spUtils, key, newMask);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            });
            builder.setNegativeButton("No Limit", (dialog, which) -> {
                try {
                    writeMethod.invoke(spUtils, key, 0);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            });
            builder.setNeutralButton("Cancel", null);

            AlertDialog dlg = builder.show();
            android.view.Window window = dlg.getWindow();
            if (window != null) {
                DisplayMetrics dm = ctx.getResources().getDisplayMetrics();
                window.setLayout(dm.widthPixels / 2, dm.heightPixels * 9 / 10);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
