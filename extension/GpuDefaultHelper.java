package app.revanced.extension.gamehub;

import android.content.Context;
import android.util.Log;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

/**
 * BannerHub Lite: ensure new games default to System Driver.
 *
 * Injected from PcGameSettingDataHelper.x() (called once per game session
 * when the PcGameSettingOperations is first created for a gameId).
 *
 * Without this fix, getSelectGpuOrDefault() falls back to the global
 * "pc_d_gpu" preference (PcGameSettingDataHelper.m()), which may point to
 * a previously downloaded custom driver that no longer exists, causing a
 * crash on first game launch.
 *
 * Fix: if no per-game GPU driver preference exists yet ("pc_ls_GPU_DRIVER_"
 * in the per-game SPUtils), write a System Driver entity (id=-1) so H0()
 * always returns non-null and the global fallback is never consulted.
 */
public class GpuDefaultHelper {

    private static final String TAG = "BannerHub";

    public static void ensureSystemDriver(Object ops) {
        try {
            Class<?> opsClass = ops.getClass();

            // If a GPU driver is already stored for this game, leave it alone
            Object current = opsClass.getMethod("H0").invoke(ops);
            if (current != null) return;

            // Get per-game SPUtils
            Object spUtils = opsClass.getMethod("h0").invoke(ops);

            // Build System Driver entity (id=-1, name=localized label)
            Object entity = buildSystemDriverEntity();
            if (entity == null) return;

            // Serialize to JSON
            Class<?> gsonClass = Class.forName("com.blankj.utilcode.util.GsonUtils");
            String json = (String) gsonClass.getMethod("j", Object.class).invoke(null, entity);

            // Write to the per-game GPU driver key
            spUtils.getClass().getMethod("o", String.class, String.class)
                    .invoke(spUtils, "pc_ls_GPU_DRIVER_", json);

            Log.d(TAG, "GpuDefaultHelper: defaulted GPU driver to System Driver for new game");
        } catch (Exception e) {
            Log.e(TAG, "GpuDefaultHelper.ensureSystemDriver error", e);
        }
    }

    /**
     * Build a PcSettingDataEntity representing System Driver:
     *   id = -1, name = localized "System Driver" label, all else = defaults.
     */
    private static Object buildSystemDriverEntity() {
        try {
            Class<?> entityClass = Class.forName("com.xj.winemu.bean.PcSettingDataEntity");
            Class<?> dcmClass    = Class.forName("kotlin.jvm.internal.DefaultConstructorMarker");

            // Find the Kotlin defaults constructor (real params + int mask + DCM)
            Constructor<?> ctor = null;
            for (Constructor<?> c : entityClass.getDeclaredConstructors()) {
                Class<?>[] pt = c.getParameterTypes();
                if (pt.length > 2
                        && pt[pt.length - 1] == dcmClass
                        && pt[pt.length - 2] == int.class) {
                    ctor = c;
                    break;
                }
            }
            if (ctor == null) return null;
            ctor.setAccessible(true);

            int totalParams   = ctor.getParameterCount();
            int numRealParams = totalParams - 2;
            Class<?>[] pt     = ctor.getParameterTypes();
            Object[] args     = new Object[totalParams];

            // Fill all real params with type-appropriate zero/null defaults
            for (int i = 0; i < numRealParams; i++) {
                Class<?> t = pt[i];
                if      (t == int.class)     args[i] = 0;
                else if (t == long.class)    args[i] = 0L;
                else if (t == boolean.class) args[i] = false;
                else                         args[i] = null;
            }

            // Explicit fields: id = -1, name = localized System Driver label
            args[0] = -1;
            args[1] = getSystemDriverName();

            // Kotlin default mask: all bits set except bit 0 (id) and bit 1 (name)
            int defaultMask = (1 << numRealParams) - 1;
            defaultMask &= ~0x3; // clear bits 0 and 1
            args[numRealParams]     = defaultMask;
            args[numRealParams + 1] = null; // DefaultConstructorMarker = null

            return ctor.newInstance(args);
        } catch (Exception e) {
            Log.e(TAG, "GpuDefaultHelper.buildSystemDriverEntity error", e);
            return null;
        }
    }

    private static String getSystemDriverName() {
        try {
            Class<?> utilsClass = Class.forName("com.blankj.utilcode.util.Utils");
            Context appCtx = (Context) utilsClass.getMethod("a").invoke(null);
            int resId = appCtx.getResources().getIdentifier(
                    "pc_gpu_official_driver", "string", appCtx.getPackageName());
            if (resId != 0) return appCtx.getString(resId);
        } catch (Exception e) {
            // fallback to English
        }
        return "System Driver";
    }
}
