package com.xj.winemu.sidebar;

import android.content.Context;

import java.io.File;
import java.io.RandomAccessFile;
import java.nio.ByteOrder;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;

/**
 * Writes AI Frame Generation settings to the 10-byte mmap file at
 * <imageFs>/etc/gamescope.control. Mirrors GameHub 6.0.1 IPC layout per
 * GAMEHUB_600_MASTER_MAP § 26.8.3.
 *
 * Byte layout (LE):
 *   0-1: uint16 FPS limit            — owned by separate sidebar control, NOT touched here
 *   2:   enabled flag (0/1)
 *   3:   NativeRenderingMode         — owned by host launcher, NOT touched here
 *   4-7: float flowScale (clamped 0.2..1.0)
 *   8:   AI model byte (0=standard, 1=clear)
 *   9:   AI multiplier byte (always 2x)
 */
public class BhFrameGenWriter {

    /** Apply persisted settings to the gamescope.control file. Call right before the
     *  Wine container reads the file (e.g. just before launch). Delegates Vulkan ICD
     *  management to {@link BhVulkanIcdWriter}. */
    public static void applyFromPrefs(Context ctx) {
        BhFrameGenSettings s = BhFrameGenSettings.load(ctx);
        write(resolveControlPath(ctx), s);
        BhVulkanIcdWriter.ensureIcdJson(ctx);
    }

    /** Apply settings without requiring a Context from the caller — looks up the app
     *  context via ActivityThread reflection. Used by the launch-time smali hook. */
    public static void applyFromPrefsNoContext() {
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            Object app = at.getMethod("currentApplication").invoke(null);
            if (app instanceof Context) {
                applyFromPrefs((Context) app);
            }
        } catch (Exception ignored) {}
    }

    /** Write our owned bytes (2, 4-7, 8, 9) to gamescope.control. Bytes 0-1 (FPS limit)
     *  and byte 3 (NativeRenderingMode) are owned by other components and left alone. */
    public static void write(String controlPath, BhFrameGenSettings s) {
        if (controlPath == null || controlPath.isEmpty() || s == null) return;
        try {
            File f = new File(controlPath);
            File parent = f.getParentFile();
            if (parent != null) parent.mkdirs();
            try (RandomAccessFile raf = new RandomAccessFile(f, "rw")) {
                if (raf.length() < 10) raf.setLength(10);
                FileChannel ch = raf.getChannel();
                MappedByteBuffer buf = ch.map(FileChannel.MapMode.READ_WRITE, 0, 10);
                buf.order(ByteOrder.LITTLE_ENDIAN);

                buf.put(2, (byte) (s.enabled ? 1 : 0));
                buf.putFloat(4, clampFloat(s.flowScale, 0.2f, 1.0f));
                buf.put(8, (byte) (s.model & 0x01));
                buf.put(9, (byte) 2);  // multiplier always 2x
                buf.force();
            }
        } catch (Exception ignored) {}
    }

    /** Write only the enabled byte (byte 2). */
    public static void writeEnabled(String controlPath, boolean enabled) {
        writeByteAt(controlPath, 2, (byte) (enabled ? 1 : 0));
    }


    /** Write only the AI model byte (byte 8). */
    public static void writeModel(String controlPath, int model) {
        writeByteAt(controlPath, 8, (byte) (model & 0x01));
    }

    /** Write only the flowScale float (bytes 4-7). */
    public static void writeFlowScale(String controlPath, float flowScale) {
        try (RandomAccessFile raf = new RandomAccessFile(controlPath, "rw")) {
            if (raf.length() < 10) raf.setLength(10);
            MappedByteBuffer buf = raf.getChannel().map(FileChannel.MapMode.READ_WRITE, 0, 10);
            buf.order(ByteOrder.LITTLE_ENDIAN);
            buf.putFloat(4, clampFloat(flowScale, 0.2f, 1.0f));
            buf.force();
        } catch (Exception ignored) {}
    }

    /** Resolve the gamescope.control path for the running OfflineHub install. */
    public static String resolveControlPath(Context ctx) {
        String pkg = ctx.getPackageName();
        return "/data/data/" + pkg + "/files/usr/etc/gamescope.control";
    }

        private static void writeByteAt(String controlPath, int offset, byte value) {
        try (RandomAccessFile raf = new RandomAccessFile(controlPath, "rw")) {
            if (raf.length() < 10) raf.setLength(10);
            MappedByteBuffer buf = raf.getChannel().map(FileChannel.MapMode.READ_WRITE, 0, 10);
            buf.put(offset, value);
            buf.force();
        } catch (Exception ignored) {}
    }

    private static int clampInt(int v, int lo, int hi) {
        return Math.max(lo, Math.min(hi, v));
    }

    private static float clampFloat(float v, float lo, float hi) {
        return Math.max(lo, Math.min(hi, v));
    }
}
