package app.revanced.extension.gamehub;

import android.content.ContentResolver;
import android.net.Uri;
import android.util.Log;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * Extracts WCP (zstd/XZ tar) and ZIP archives into a component directory.
 * Uses reflection for GameHub's obfuscated runtime classes (5.1.4):
 *   TarArchiveInputStream.getNextTarEntry() → f()
 *   TarArchiveEntry.getName() → p()
 */
@SuppressWarnings("unused")
public final class WcpExtractor {

    private static final String TAG = "BannerHub";
    private static final int BUF = 8192;

    private WcpExtractor() {}

    public static void extract(ContentResolver cr, Uri uri, File destDir) throws Exception {
        InputStream raw = cr.openInputStream(uri);
        if (raw == null) throw new IOException("Cannot open URI: " + uri);
        try {
            BufferedInputStream bis = new BufferedInputStream(raw);
            try {
                bis.mark(4);
                byte[] hdr = new byte[4];
                int read = bis.read(hdr, 0, 4);
                bis.reset();
                if (read < 2) throw new IOException("File too short");

                int b0 = hdr[0] & 0xFF, b1 = hdr[1] & 0xFF,
                    b2 = hdr[2] & 0xFF, b3 = hdr[3] & 0xFF;

                if (b0 == 0x50 && b1 == 0x4B) {
                    // ZIP: PK magic
                    clearDir(destDir); destDir.mkdirs();
                    extractZip(bis, destDir);
                } else if (b0 == 0x28 && b1 == 0xB5 && b2 == 0x2F && b3 == 0xFD) {
                    // zstd tar
                    clearDir(destDir); destDir.mkdirs();
                    InputStream zstd = openZstd(bis);
                    try { extractTar(zstd, destDir); } finally { zstd.close(); }
                } else if (b0 == 0xFD && b1 == 0x37 && b2 == 0x7A && b3 == 0x58) {
                    // XZ tar
                    clearDir(destDir); destDir.mkdirs();
                    InputStream xz = openXz(bis);
                    try { extractTar(xz, destDir); } finally { xz.close(); }
                } else {
                    throw new Exception(String.format(
                            "Unknown format (magic: %02X %02X %02X %02X)", b0, b1, b2, b3));
                }
            } finally {
                bis.close();
            }
        } finally {
            raw.close();
        }
    }

    /** Extract from URL stream (for ComponentDownloadActivity). */
    public static void extractFromStream(InputStream rawStream, File destDir) throws Exception {
        BufferedInputStream bis = new BufferedInputStream(rawStream);
        bis.mark(4);
        byte[] hdr = new byte[4];
        int read = bis.read(hdr, 0, 4);
        bis.reset();
        if (read < 2) throw new IOException("File too short");

        int b0 = hdr[0] & 0xFF, b1 = hdr[1] & 0xFF,
            b2 = hdr[2] & 0xFF, b3 = hdr[3] & 0xFF;

        if (b0 == 0x50 && b1 == 0x4B) {
            clearDir(destDir); destDir.mkdirs();
            extractZip(bis, destDir);
        } else if (b0 == 0x28 && b1 == 0xB5 && b2 == 0x2F && b3 == 0xFD) {
            clearDir(destDir); destDir.mkdirs();
            InputStream zstd = openZstd(bis);
            try { extractTar(zstd, destDir); } finally { zstd.close(); }
        } else if (b0 == 0xFD && b1 == 0x37 && b2 == 0x7A && b3 == 0x58) {
            clearDir(destDir); destDir.mkdirs();
            InputStream xz = openXz(bis);
            try { extractTar(xz, destDir); } finally { xz.close(); }
        } else {
            throw new Exception(String.format(
                    "Unknown format (magic: %02X %02X %02X %02X)", b0, b1, b2, b3));
        }
    }

    private static InputStream openZstd(InputStream in) throws Exception {
        Class<?> cls = Class.forName("com.github.luben.zstd.ZstdInputStreamNoFinalizer");
        Constructor<?> ctor = cls.getConstructor(InputStream.class);
        return (InputStream) ctor.newInstance(in);
    }

    private static InputStream openXz(InputStream in) throws Exception {
        Class<?> cls = Class.forName("org.tukaani.xz.XZInputStream");
        Constructor<?> ctor = cls.getConstructor(InputStream.class, int.class);
        return (InputStream) ctor.newInstance(in, -1);
    }

    private static void extractZip(InputStream in, File destDir) throws IOException {
        byte[] buf = new byte[BUF];
        ZipInputStream zip = new ZipInputStream(in);
        ZipEntry entry;
        while ((entry = zip.getNextEntry()) != null) {
            if (entry.isDirectory()) { zip.closeEntry(); continue; }
            String name = new File(entry.getName()).getName();
            File out = new File(destDir, name);
            try (FileOutputStream fos = new FileOutputStream(out)) { pipe(zip, fos, buf); }
            zip.closeEntry();
        }
        zip.close();
    }

    private static void extractTar(InputStream in, File destDir) throws Exception {
        Class<?> tarClass = Class.forName(
                "org.apache.commons.compress.archivers.tar.TarArchiveInputStream");
        Constructor<?> tarCtor = tarClass.getConstructor(InputStream.class);
        Object tar = tarCtor.newInstance(in);

        Method nextEntry = tarClass.getMethod("f"); // obfuscated getNextTarEntry() in 5.1.4
        Method getName = null; // resolved on first entry → obfuscated to p() in 5.1.4

        byte[] buf = new byte[BUF];
        boolean flattenToRoot = false;

        Object entry;
        while ((entry = nextEntry.invoke(tar)) != null) {
            if (getName == null) {
                getName = entry.getClass().getMethod("p"); // obfuscated getName() in 5.1.4
            }
            String name = (String) getName.invoke(entry);
            if (name == null) continue;
            if (name.endsWith("/")) continue;

            if (name.endsWith("profile.json")) {
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                pipeReflected(tar, baos, buf);
                if (baos.toString("UTF-8").contains("FEXCore")) flattenToRoot = true;
                continue;
            }

            if (name.startsWith("./")) name = name.substring(2);
            if (name.isEmpty()) continue;

            File dest;
            if (flattenToRoot) {
                dest = new File(destDir, new File(name).getName());
            } else {
                dest = new File(destDir, name);
                File parent = dest.getParentFile();
                if (parent != null) parent.mkdirs();
            }
            try (FileOutputStream fos = new FileOutputStream(dest)) { pipeReflected(tar, fos, buf); }
        }
        tarClass.getMethod("close").invoke(tar);
    }

    private static void pipe(InputStream in, OutputStream out, byte[] buf) throws IOException {
        int n;
        while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
    }

    private static void pipeReflected(Object tar, OutputStream out, byte[] buf) throws Exception {
        Method readMethod = tar.getClass().getMethod("read", byte[].class, int.class, int.class);
        int n;
        while ((n = (int) readMethod.invoke(tar, buf, 0, buf.length)) > 0) {
            out.write(buf, 0, n);
        }
    }

    static void clearDir(File dir) {
        File[] files = dir.listFiles();
        if (files == null) return;
        for (File f : files) {
            if (f.isDirectory()) clearDir(f);
            if (!f.delete()) Log.w(TAG, "clearDir: failed to delete " + f.getAbsolutePath());
        }
    }
}
