package com.xj.winemu.sidebar;

import android.content.Context;
import android.content.SharedPreferences;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;

/**
 * Manages Vulkan ICD selection (libGameScopeVK.so vs libGameScopeV2.so)
 * and writes the correct per-package ICD JSON before Wine container launch.
 *
 * Preference key: "bh_vulkan_driver"
 *   "vk"  — libGameScopeVK.so (default, with BYPASS_XSERVER + FrameGen)
 *   "v2"  — libGameScopeV2.so (GPU spoofing, no BYPASS_XSERVER)
 */
public class BhVulkanIcdWriter {

    private static final String PREFS_NAME = "bh_vulkan_icd";
    private static final String KEY_DRIVER = "bh_vulkan_driver";
    public  static final String DRIVER_VK  = "vk";
    public  static final String DRIVER_V2  = "v2";

    // ── Preference access ─────────────────────────────────────────────────────

    public static String getSelectedDriver(Context ctx) {
        return prefs(ctx).getString(KEY_DRIVER, DRIVER_VK);
    }

    public static void setSelectedDriver(Context ctx, String driver) {
        prefs(ctx).edit().putString(KEY_DRIVER, driver).apply();
    }

    public static boolean isV2Selected(Context ctx) {
        return DRIVER_V2.equals(getSelectedDriver(ctx));
    }

    public static boolean isV2Available(Context ctx) {
        return new File(resolveV2LibraryPath(ctx)).exists();
    }

    // ── Main entry point ──────────────────────────────────────────────────────

    /** Write the correct ICD JSON based on user preference.
     *  Deletes the inactive ICD JSON so Vulkan loader uses only one driver. */
    public static void ensureIcdJson(Context ctx) {
        if (isV2Selected(ctx) && isV2Available(ctx)) {
            ensureIcdJsonForPath(ctx, resolveV2LibraryPath(ctx), resolveV2JsonPath(ctx));
            deleteFile(resolveVkJsonPath(ctx));
        } else {
            ensureIcdJsonForPath(ctx, resolveVkLibraryPath(ctx), resolveVkJsonPath(ctx));
            deleteFile(resolveV2JsonPath(ctx));
        }
    }

    // ── Path resolution ───────────────────────────────────────────────────────

    public static String resolveVkLibraryPath(Context ctx) {
        return dataPath(ctx) + "/files/usr/lib/libGameScopeVK.so";
    }

    public static String resolveV2LibraryPath(Context ctx) {
        return dataPath(ctx) + "/files/usr/lib/libGameScopeV2.so";
    }

    public static String resolveVkJsonPath(Context ctx) {
        return dataPath(ctx)
                + "/files/usr/home/steamuser/.config/vulkan/icd.d/GameScopeVK_icd.json";
    }

    public static String resolveV2JsonPath(Context ctx) {
        return dataPath(ctx)
                + "/files/usr/home/steamuser/.config/vulkan/icd.d/GameScopeV2_icd.json";
    }

    // ── ICD JSON writer ───────────────────────────────────────────────────────

    /** Idempotent: only writes if contents differ. No-op if .so is absent. */
    private static void ensureIcdJsonForPath(Context ctx, String libPath, String jsonPath) {
        try {
            if (!new File(libPath).exists()) return;
            String desired =
                    "{\n"
                  + "  \"file_format_version\": \"1.0.0\",\n"
                  + "  \"ICD\": {\n"
                  + "    \"library_path\": \"" + libPath + "\",\n"
                  + "    \"api_version\": \"1.3.216\"\n"
                  + "  }\n"
                  + "}\n";
            File icd = new File(jsonPath);
            File parent = icd.getParentFile();
            if (parent != null) parent.mkdirs();
            byte[] desiredBytes = desired.getBytes(StandardCharsets.UTF_8);
            if (icd.exists() && icd.length() == desiredBytes.length) {
                byte[] cur = new byte[(int) icd.length()];
                try (FileInputStream fis = new FileInputStream(icd)) {
                    int read = 0, n;
                    while (read < cur.length
                            && (n = fis.read(cur, read, cur.length - read)) > 0) {
                        read += n;
                    }
                }
                if (new String(cur, StandardCharsets.UTF_8).equals(desired)) return;
            }
            try (FileOutputStream fos = new FileOutputStream(icd)) {
                fos.write(desiredBytes);
            }
        } catch (Exception ignored) {}
    }

    private static void deleteFile(String path) {
        try { new File(path).delete(); } catch (Exception ignored) {}
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    private static String dataPath(Context ctx) {
        return "/data/data/" + ctx.getPackageName();
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }
}
