package app.revanced.extension.gamehub;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * BannerHub Lite — Component Manager.
 * UI matches BannerHub 5.3.5 exactly (from screenshots):
 *
 *   Mode 0  Main list:   + Add New Component | <dir names> | ✕ Remove All
 *   Mode 1  Options:     Inject/Replace file... | Backup | Remove | ← Back
 *   Mode 2  TypeSelect:  ↓ Download | DXVK | VKD3D-Proton | Box64 | FEXCore | GPU Driver/Turnip | ← Back
 *   Mode 3  Awaiting file picker for new injection
 */
@SuppressWarnings("unused")
public class ComponentManagerActivity extends Activity {

    private static final String TAG = "BannerHub";
    private static final int REQUEST_PICK_FILE = 0x3e9;

    // GameHub EmuComponents content-type ints
    static final int TYPE_GPU_DRIVER = 10;
    static final int TYPE_DXVK      = 12;
    static final int TYPE_VKD3D     = 13;
    static final int TYPE_BOX64     = 94;
    static final int TYPE_FEXCORE   = 95;

    private File   componentsDir;
    private File[] components = new File[0];
    private ListView listView;

    private int mode;          // 0–3
    private int selectedIndex; // into components[]
    private int selectedType;  // content-type for new inject

    // ── Lifecycle ─────────────────────────────────────────────────────────────

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        componentsDir = new File(getFilesDir(), "usr/home/components");

        TextView title = new TextView(this);
        title.setText("Banners Component Manager");
        title.setTextSize(18f);
        title.setTextColor(0xFFFFFFFF);
        title.setPadding(48, 24, 48, 24);

        listView = new ListView(this);
        listView.setClipToPadding(false);
        listView.setOnItemClickListener((p, v, pos, id) -> onItemClick(pos));

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setFitsSystemWindows(true);
        root.addView(title, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));
        root.addView(listView, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f));

        setContentView(root);
        showComponents();
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (mode == 0) showComponents(); // refresh after returning from download activity
    }

    @Override
    public void onBackPressed() {
        if (mode != 0) showComponents();
        else super.onBackPressed();
    }

    // ── Mode 0: main component list ───────────────────────────────────────────

    private void showComponents() {
        mode = 0;
        componentsDir.mkdirs();
        File[] dirs = componentsDir.listFiles(File::isDirectory);
        if (dirs != null) { Arrays.sort(dirs); components = dirs; }
        else components = new File[0];

        List<String> rows = new ArrayList<>();
        rows.add("+ Add New Component");
        for (File d : components) rows.add(d.getName());
        if (components.length > 0) rows.add("\u2715 Remove All Components");

        setAdapter(rows);
    }

    // ── Mode 1: per-component options ─────────────────────────────────────────

    private void showOptions() {
        mode = 1;
        List<String> opts = new ArrayList<>();
        opts.add("Inject/Replace file...");
        opts.add("Backup");
        opts.add("Remove");
        opts.add("\u2190 Back");
        setAdapter(opts);
    }

    // ── Mode 2: type selection for new component ───────────────────────────────

    private void showTypeSelection() {
        mode = 2;
        List<String> opts = new ArrayList<>();
        opts.add("\u2193 Download from Online Repos");
        opts.add("DXVK");
        opts.add("VKD3D-Proton");
        opts.add("Box64");
        opts.add("FEXCore");
        opts.add("GPU Driver / Turnip");
        opts.add("\u2190 Back");
        setAdapter(opts);
    }

    // ── Click dispatcher ──────────────────────────────────────────────────────

    private void onItemClick(int pos) {
        if (mode == 0) {
            if (pos == 0) {
                showTypeSelection();
            } else if (pos <= components.length) {
                selectedIndex = pos - 1;
                showOptions();
            } else {
                confirmRemoveAll();
            }

        } else if (mode == 1) {
            switch (pos) {
                case 0: mode = 1; pickFile(); break;     // Inject/Replace (keeps mode=1)
                case 1: backupComponent(); break;
                case 2: confirmRemove(); break;
                case 3: showComponents(); break;          // ← Back
            }

        } else if (mode == 2) {
            switch (pos) {
                case 0: startActivity(new Intent(this, ComponentDownloadActivity.class)); break;
                case 1: selectedType = TYPE_DXVK;       mode = 3; pickFile(); break;
                case 2: selectedType = TYPE_VKD3D;      mode = 3; pickFile(); break;
                case 3: selectedType = TYPE_BOX64;      mode = 3; pickFile(); break;
                case 4: selectedType = TYPE_FEXCORE;    mode = 3; pickFile(); break;
                case 5: selectedType = TYPE_GPU_DRIVER; mode = 3; pickFile(); break;
                case 6: showComponents(); break;          // ← Back
            }
        }
    }

    // ── File picker ───────────────────────────────────────────────────────────

    private void pickFile() {
        Intent i = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        i.addCategory(Intent.CATEGORY_OPENABLE);
        i.setType("*/*");
        startActivityForResult(i, REQUEST_PICK_FILE);
    }

    @Override
    protected void onActivityResult(int req, int res, Intent data) {
        super.onActivityResult(req, res, data);
        if (req != REQUEST_PICK_FILE || res != RESULT_OK || data == null || data.getData() == null) {
            showComponents();
            return;
        }
        Uri uri = data.getData();

        if (mode == 3) {
            // New component: WCP/ZIP extract + register with EmuComponents
            int type = selectedType;
            new Thread(() -> {
                ComponentInjectorHelper.injectComponent(this, uri, type);
                runOnUiThread(this::showComponents);
            }).start();
        } else if (mode == 1) {
            // Existing component: raw file copy into component dir
            injectRaw(uri);
        } else {
            showComponents();
        }
    }

    // ── Raw copy (Inject/Replace into existing component) ─────────────────────

    private void injectRaw(Uri uri) {
        File destDir = components[selectedIndex];
        String filename = ComponentInjectorHelper.getDisplayName(this, uri);
        if (filename == null || filename.isEmpty()) filename = "injected_file";
        File destFile = new File(destDir, filename);
        final String name = filename;

        new Thread(() -> {
            try (InputStream in = getContentResolver().openInputStream(uri);
                 OutputStream out = new FileOutputStream(destFile)) {
                byte[] buf = new byte[8192];
                int n;
                if (in != null) while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
                runOnUiThread(() -> {
                    Toast.makeText(this, "Injected: " + name, Toast.LENGTH_SHORT).show();
                    showComponents();
                });
            } catch (Exception e) {
                Log.e(TAG, "injectRaw failed", e);
                String msg = e.getMessage() != null ? e.getMessage() : e.getClass().getSimpleName();
                runOnUiThread(() -> {
                    Toast.makeText(this, "Inject failed: " + msg, Toast.LENGTH_LONG).show();
                    showComponents();
                });
            }
        }).start();
    }

    // ── Remove component ──────────────────────────────────────────────────────

    private void confirmRemove() {
        String name = components[selectedIndex].getName();
        new AlertDialog.Builder(this)
                .setTitle("Remove Component")
                .setMessage("Delete \"" + name + "\"? This cannot be undone.")
                .setPositiveButton("Remove", (d, w) -> {
                    ComponentInjectorHelper.unregisterComponent(name);
                    deleteDir(components[selectedIndex]);
                    Toast.makeText(this, "Removed: " + name, Toast.LENGTH_SHORT).show();
                    showComponents();
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    // ── Remove All ────────────────────────────────────────────────────────────

    private void confirmRemoveAll() {
        new AlertDialog.Builder(this)
                .setTitle("Remove All Components")
                .setMessage("Remove all " + components.length + " component(s)?\nThis cannot be undone.")
                .setPositiveButton("Remove All", (d, w) -> {
                    for (File dir : components) {
                        // Only remove BannerHub-injected dirs (stamped with .bh_injected)
                        if (new File(dir, ".bh_injected").exists()) {
                            ComponentInjectorHelper.unregisterComponent(dir.getName());
                            deleteDir(dir);
                        }
                    }
                    Toast.makeText(this, "BannerHub components removed", Toast.LENGTH_SHORT).show();
                    showComponents();
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    // ── Backup ────────────────────────────────────────────────────────────────

    private void backupComponent() {
        File src = components[selectedIndex];
        String name = src.getName();
        File dst = new File(
                android.os.Environment.getExternalStoragePublicDirectory(
                        android.os.Environment.DIRECTORY_DOWNLOADS),
                "BannerHub/" + name);
        dst.mkdirs();

        new Thread(() -> {
            try {
                copyDir(src, dst);
                runOnUiThread(() -> {
                    Toast.makeText(this, "Backed up to Downloads/BannerHub/" + name,
                            Toast.LENGTH_SHORT).show();
                    showComponents();
                });
            } catch (Exception e) {
                Log.e(TAG, "Backup failed", e);
                runOnUiThread(() -> {
                    Toast.makeText(this, "Backup failed: " + e.getMessage(),
                            Toast.LENGTH_LONG).show();
                    showComponents();
                });
            }
        }).start();
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    private void setAdapter(List<String> items) {
        listView.setAdapter(new ArrayAdapter<>(this,
                android.R.layout.simple_list_item_1, items));
    }

    static void deleteDir(File dir) {
        File[] files = dir.listFiles();
        if (files != null) for (File f : files) {
            if (f.isDirectory()) deleteDir(f);
            else f.delete();
        }
        dir.delete();
    }

    private static void copyDir(File src, File dst) throws Exception {
        dst.mkdirs();
        File[] files = src.listFiles();
        if (files == null) return;
        byte[] buf = new byte[8192];
        for (File f : files) {
            if (f.isDirectory()) {
                copyDir(f, new File(dst, f.getName()));
            } else {
                try (InputStream in = new FileInputStream(f);
                     OutputStream out = new FileOutputStream(new File(dst, f.getName()))) {
                    int n;
                    while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
                }
            }
        }
    }
}
