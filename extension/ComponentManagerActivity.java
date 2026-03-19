package app.revanced.extension.gamehub;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.OpenableColumns;
import android.text.InputType;
import android.util.Log;
import android.view.Gravity;
import android.widget.ArrayAdapter;
import android.widget.EditText;
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
 * BannerHub Lite — Component Manager Activity.
 * Full feature parity with BannerHub 5.3.5:
 *   - Inject WCP/ZIP/XZ file (with duplicate prevention)
 *   - Add New Component (creates empty folder)
 *   - Remove component folder
 *   - Remove All component folders
 *   - Backup component to Downloads/BannerHub/
 *   - Download from Online Repos (opens ComponentDownloadActivity)
 */
@SuppressWarnings("unused")
public class ComponentManagerActivity extends Activity {

    private static final String TAG = "BannerHub";
    private static final int REQUEST_CODE_PICK_WCP = 1001;
    private static final String PREFS_INJECTED = "bh_injected";

    private File componentsDir;
    private SharedPreferences injectedPrefs;
    private String selectedComponent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        componentsDir = new File(getFilesDir(), "usr/home/components");
        injectedPrefs = getSharedPreferences(PREFS_INJECTED, MODE_PRIVATE);
        showComponents();
    }

    // ── Screen: component list ────────────────────────────────────────────────

    private void showComponents() {
        List<String> rows = new ArrayList<>();
        rows.add("[+ Add New Component]");
        rows.add("[↓ Download from Online Repos]");
        rows.add("[✕ Remove All Components]");

        if (componentsDir.isDirectory()) {
            File[] dirs = componentsDir.listFiles(File::isDirectory);
            if (dirs != null) {
                Arrays.sort(dirs);
                for (File d : dirs) {
                    String name = d.getName();
                    String injected = injectedPrefs.getString(name, null);
                    rows.add(injected != null ? name + " [-> " + injected + "]" : name);
                }
            }
        }
        if (rows.size() == 3) rows.add("(no components found)");

        LinearLayout root = buildRoot();
        ListView listView = buildList(root, rows);
        setContentView(root);

        listView.setOnItemClickListener((parent, view, position, id) -> {
            String raw = rows.get(position);
            if (raw.equals("[+ Add New Component]")) {
                showAddNewComponentDialog();
            } else if (raw.equals("[↓ Download from Online Repos]")) {
                startActivity(new Intent(this, ComponentDownloadActivity.class));
            } else if (raw.equals("[✕ Remove All Components]")) {
                confirmRemoveAll();
            } else if (raw.equals("(no components found)")) {
                // no-op
            } else {
                int bracket = raw.indexOf(" [-> ");
                selectedComponent = bracket >= 0 ? raw.substring(0, bracket) : raw;
                showOptions();
            }
        });
    }

    // ── Screen: per-component options ─────────────────────────────────────────

    private void showOptions() {
        List<String> options = new ArrayList<>();
        options.add("Inject file");
        options.add("Download from Online Repos");
        options.add("Remove Component");
        options.add("Backup");
        options.add("Back");

        LinearLayout root = buildRoot();
        TextView subtitle = new TextView(this);
        subtitle.setText(selectedComponent);
        subtitle.setTextSize(14f);
        subtitle.setPadding(0, 0, 0, 24);
        root.addView(subtitle);

        ListView listView = buildList(root, options);
        setContentView(root);

        listView.setOnItemClickListener((parent, view, position, id) -> {
            switch (position) {
                case 0: openFilePicker(); break;
                case 1:
                    Intent intent = new Intent(this, ComponentDownloadActivity.class);
                    intent.putExtra("target_component", selectedComponent);
                    startActivity(intent);
                    break;
                case 2: confirmRemoveComponent(selectedComponent); break;
                case 3: backupComponent(selectedComponent); break;
                case 4: showComponents(); break;
            }
        });
    }

    // ── Add New Component ─────────────────────────────────────────────────────

    private void showAddNewComponentDialog() {
        EditText input = new EditText(this);
        input.setInputType(InputType.TYPE_CLASS_TEXT);
        input.setHint("Component name (e.g. dxvk)");
        input.setPadding(48, 24, 48, 24);

        new AlertDialog.Builder(this)
                .setTitle("Add New Component")
                .setView(input)
                .setPositiveButton("Create", (dialog, which) -> {
                    String name = input.getText().toString().trim();
                    if (name.isEmpty()) {
                        Toast.makeText(this, "Name cannot be empty", Toast.LENGTH_SHORT).show();
                        return;
                    }
                    File newDir = new File(componentsDir, name);
                    if (newDir.exists()) {
                        Toast.makeText(this, "Component already exists: " + name, Toast.LENGTH_SHORT).show();
                    } else {
                        newDir.mkdirs();
                        Toast.makeText(this, "Created: " + name, Toast.LENGTH_SHORT).show();
                    }
                    showComponents();
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    // ── Remove Component ──────────────────────────────────────────────────────

    private void confirmRemoveComponent(String name) {
        new AlertDialog.Builder(this)
                .setTitle("Remove Component")
                .setMessage("Delete \"" + name + "\"? This cannot be undone.")
                .setPositiveButton("Delete", (dialog, which) -> {
                    File dir = new File(componentsDir, name);
                    deleteRecursive(dir);
                    injectedPrefs.edit().remove(name).apply();
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
                .setMessage("Delete ALL component folders? This cannot be undone.")
                .setPositiveButton("Delete All", (dialog, which) -> {
                    if (componentsDir.isDirectory()) {
                        File[] dirs = componentsDir.listFiles(File::isDirectory);
                        if (dirs != null) {
                            for (File d : dirs) deleteRecursive(d);
                        }
                    }
                    injectedPrefs.edit().clear().apply();
                    Toast.makeText(this, "All components removed", Toast.LENGTH_SHORT).show();
                    showComponents();
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static void deleteRecursive(File file) {
        if (file.isDirectory()) {
            File[] children = file.listFiles();
            if (children != null) for (File c : children) deleteRecursive(c);
        }
        file.delete();
    }

    // ── File injection ─────────────────────────────────────────────────────────

    private void openFilePicker() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");
        startActivityForResult(intent, REQUEST_CODE_PICK_WCP);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQUEST_CODE_PICK_WCP || resultCode != RESULT_OK
                || data == null || data.getData() == null) return;

        Uri uri = data.getData();
        File destDir = new File(componentsDir, selectedComponent);
        final String componentName = selectedComponent;
        final String filename = getFileName(uri);

        // Duplicate prevention: check if file already in dest
        if (filename != null) {
            File existing = new File(destDir, filename);
            if (existing.exists()) {
                Toast.makeText(this, "Already installed: " + filename, Toast.LENGTH_LONG).show();
                return;
            }
        }

        Handler uiHandler = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            try {
                WcpExtractor.extract(getContentResolver(), uri, destDir);
                if (filename != null) {
                    injectedPrefs.edit().putString(componentName, filename).apply();
                }
                uiHandler.post(() -> {
                    Toast.makeText(this, "Injected successfully", Toast.LENGTH_SHORT).show();
                    showComponents();
                });
            } catch (Throwable t) {
                Log.e(TAG, "Extraction failed", t);
                String msg = t.getMessage() != null ? t.getMessage() : t.getClass().getSimpleName();
                uiHandler.post(() ->
                        Toast.makeText(this, "Inject failed: " + msg, Toast.LENGTH_LONG).show());
            }
        }).start();
    }

    private String getFileName(Uri uri) {
        try (Cursor cursor = getContentResolver().query(
                uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) return cursor.getString(0);
        } catch (Exception e) {
            Log.e(TAG, "getFileName failed", e);
        }
        return null;
    }

    // ── Backup ────────────────────────────────────────────────────────────────

    private void backupComponent(String name) {
        File src = new File(componentsDir, name);
        if (!src.isDirectory()) {
            Toast.makeText(this, "Component directory not found", Toast.LENGTH_SHORT).show();
            return;
        }
        File backupRoot = new File(
                android.os.Environment.getExternalStoragePublicDirectory(
                        android.os.Environment.DIRECTORY_DOWNLOADS),
                "BannerHub/" + name);
        backupRoot.mkdirs();
        Handler uiHandler = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            try {
                copyDir(src, backupRoot);
                uiHandler.post(() ->
                        Toast.makeText(this, "Backed up to Downloads/BannerHub/" + name,
                                Toast.LENGTH_SHORT).show());
            } catch (Exception e) {
                Log.e(TAG, "Backup failed", e);
                uiHandler.post(() ->
                        Toast.makeText(this, "Backup failed: " + e.getMessage(),
                                Toast.LENGTH_SHORT).show());
            }
        }).start();
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

    // ── UI helpers ────────────────────────────────────────────────────────────

    private LinearLayout buildRoot() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(48, 48, 48, 48);

        TextView title = new TextView(this);
        title.setText("BannerHub Lite — Components");
        title.setTextSize(20f);
        title.setGravity(Gravity.CENTER);
        title.setPadding(0, 0, 0, 24);
        root.addView(title);
        return root;
    }

    private ListView buildList(LinearLayout root, List<String> items) {
        ArrayAdapter<String> adapter = new ArrayAdapter<>(
                this, android.R.layout.simple_list_item_1, items);
        ListView listView = new ListView(this);
        listView.setAdapter(adapter);
        root.addView(listView, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f));
        return listView;
    }
}
