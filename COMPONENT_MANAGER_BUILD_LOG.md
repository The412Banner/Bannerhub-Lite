# BannerHub Lite — Component Manager Build Log

**Repo:** https://github.com/The412Banner/bh-lite
**Base APK:** GameHub Lite 5.1.4 (vanilla, non-ReVanced)
**Purpose:** Detailed technical log of every change made to the component manager feature — what broke, what was discovered, what was changed, and why. Required for build reproducibility and future context.

---

## Entry 001 — Initial Component Manager (v0.1.0 init)

### What was built
- `ComponentManagerActivity.java` — activity with ListView UI; modes for list, options, add-new, type-select
- `ComponentManagerHelper.java` — smali-called statics: `addComponentsMenuItem`, `handleMenuItemClick`, `setupBciButton`
- `ComponentDownloadActivity.java` — 3-level nav (repo → category → asset) + download+extract
- `WcpExtractor.java` — WCP/ZIP/XZ extraction via reflection against GameHub's obfuscated commons-compress

### Files created
- `extension/ComponentManagerActivity.java`
- `extension/ComponentManagerHelper.java`
- `extension/ComponentDownloadActivity.java`
- `extension/WcpExtractor.java`

### Known issues at this point
- Components created folders on disk only — never registered with `EmuComponents`
- "Add New Component" showed a text input dialog (wrong — BH 5.3.5 uses type selection)
- List included menu options not present in original BannerHub
- T3st31/hub_emu repo returned HTTP 404

---

## Entry 002 — invoke-static/range fix (v0.1.1-pre)

### Problem
CI smali assembler error: `Invalid register: v21. Must be between v0 and v15`

### Root cause
`LandscapeLauncherMainActivity.initView()` has `.locals 21`. In a non-static method, `p0` (this) maps to register `v21`. The non-range `invoke-static {p0}` encoding only supports registers v0–v15 (4-bit field). v21 overflows.

### Fix
Changed `invoke-static {p0}` → `invoke-static/range {p0 .. p0}` in build workflows.

### Files modified
- `.github/workflows/build.yml`
- `.github/workflows/build-quick.yml`

### CI
- Run: v0.1.1-pre — ✅ success

---

## Entry 003 — Hidden API + diagnosis logs (v0.1.2-pre)

### Problem
Zero BannerHub log entries in logcat — code either never ran or failed silently before first log line.

### Root cause
`addComponentsMenuItem` was using `ActivityThread.currentApplication()` (hidden API, blocked Android 9+) to get a Context. This would throw `NoSuchMethodException` (or be blocked silently before any logging could happen).

### Fix
- Changed `ComponentManagerHelper.addComponentsMenuItem(Object dialog, List items)` — now calls `dialog.getClass().getMethod("getContext").invoke(dialog)` (public Fragment/DialogFragment API)
- Changed signature from `(List)` to `(Object, List)` — smali injection updated to pass `v0` (dialog) as first arg
- Added `Log.d("BannerHub", ...)` at start of `addComponentsMenuItem`, `handleMenuItemClick`, `setupBciButton`

### Files modified
- `extension/ComponentManagerHelper.java`
- `.github/workflows/build.yml`
- `.github/workflows/build-quick.yml`

### CI
- Run: v0.1.2-pre — ✅ success

---

## Entry 004 — List refresh + folder naming + T3st31 removal (v0.1.3-pre)

### Problems (found via logcat `logcat_2026-03-19_07-56-38.txt`)
1. `E/BannerHub: fetchAndShowAssets failed — HTTP 404 for https://api.github.com/repos/T3st31/hub_emu/releases?per_page=50` (appeared twice — two concurrent thread calls)
2. After downloading a component and returning to ComponentManagerActivity, the newly created folder did not appear in the list
3. All GPU driver downloads went into the same `gpu_driver/` folder (overwriting on each download)

### Root cause analysis

**T3st31 404:**
- T3st31's repo `hub_emu` does not use GitHub Releases API format
- Uses a custom `rankings.json` format (not implemented in bh-lite)
- Fix: remove T3st31 from REPOS list entirely

**List not refreshing:**
- `ComponentManagerActivity.onCreate()` called `showComponents()` once
- No `onResume()` override → when returning from `ComponentDownloadActivity`, `onCreate()` does not re-run; list stays stale
- Fix: add `@Override protected void onResume() { if (mode == 0) showComponents(); }`

**Generic folder names:**
- `ComponentDownloadActivity.downloadAndInject()` called `guessComponentFolder()` which mapped all GPU driver assets to `"gpu_driver"`, all DXVK to `"dxvk"`, etc.
- Every GPU driver download overwrote the previous one
- Fix: strip extension from asset filename → e.g. `Mesa_Turnip_26.1.0_R4.zip` → folder `Mesa_Turnip_26.1.0_R4`

### Files modified
- `extension/ComponentManagerActivity.java` — added `onResume()`
- `extension/ComponentDownloadActivity.java` — replaced `guessComponentFolder()` with asset-name strip-ext; removed T3st31 from REPOS

### CI
- Run: v0.1.3-pre — ✅ success

---

## Entry 005 — EmuComponents registration + correct UI flow (v0.1.4-pre)

### Problems (user-reported after v0.1.3-pre)
1. **Components do not populate game settings component picker** — after downloading/injecting a component, it does not appear in the per-game DXVK/Box64/GPU Driver etc. selection menus
2. **"Add New Component" shows wrong UI** — showed a text input dialog asking to name a component; original BannerHub shows a type selection list (DXVK / VKD3D-Proton / Box64 / FEXCore / GPU Driver / Turnip)
3. **Menu options don't match original** — bh-lite had "Download from Online Repos" in the main list AND in per-component options; original only has it in the type-selection flow

### Root cause analysis — why components did not appear in game settings

#### Step 1: Understand how GameHub stores and loads components

Read smali files from decompiled GameHub Lite 5.1.4 (in `ghl_inspect/`):

**`ghl_inspect/smali_classes4/com/xj/winemu/EmuComponents.smali`**
- `EmuComponents` is a singleton with a `HashMap<String, ComponentRepo>` field (`a`) and a `SharedPreferences` field (`b`, key `"sp_winemu_all_components12"`)
- `B(ComponentRepo)` — sets state to `Downloaded`, then calls `C()`
- `C(ComponentRepo)` — puts `ComponentRepo` in HashMap with key=`getName()`, serializes to JSON via `GsonUtils.j()`, saves to SharedPreferences with same key
- `D()` — serializes entire HashMap back to SharedPreferences (full save)
- `A()` — iterates HashMap, sets all `Downloaded` state repos to `None`, then calls `D()` (this would DESTROY any component registered via `B()`)
- `w(List<String>)` — removes each name from HashMap AND SharedPreferences, applies; correct unregister method
- Companion field: `.field public static final c:EmuComponents$Companion;`; method `a()` on companion returns the singleton

**Conclusion:** bh-lite was only creating folders on disk. It never called `EmuComponents.C()` or `B()` to register a `ComponentRepo` in the HashMap/SharedPreferences. GameHub's game settings picker reads from EmuComponents, not from disk scan.

**Critical insight:** Must NOT use `B()` — it sets state=Downloaded which gets reset to None by `A()`. Must call `C()` directly with a `ComponentRepo` that already has `State.Extracted`.

#### Step 2: Understand what GameHub's game settings picker reads

Read smali:

**`ghl_inspect/smali_classes4/com/xj/winemu/settings/GameSettingViewModel$fetchList$1.smali`**
- This is a Kotlin coroutine lambda (suspend function) that fetches the component list for a given content type
- Fields on the lambda: `$contentType:I` (the requested type), `$result`, `$callback`
- At line 2352–2354, the key sequence:
  ```smali
  iget-object v0, v7, ...->$result:Lcom/xj/common/data/model/CommResultEntity;

  invoke-virtual {v0, v13}, ...CommResultEntity;->setData(Ljava/lang/Object;)V
  ```
  Where `v13` is the `List<DialogSettingListItemEntity>` fetched from the server API
- **Injection point:** prepend `appendLocalComponents(v13, $contentType)` before this `setData()` call to merge locally registered components into the server list before it is delivered to the UI

**`ghl_inspect/smali_classes4/com/xj/winemu/bean/DialogSettingListItemEntity.smali`**
- Full 21-param primary constructor (mapped by reading field iput sequence):
  ```
  (int id, int type, boolean isSelected,
   String title, String desc, int width, int height,
   String value, int valueInt, String fileMd5, long fileSize,
   String fileName, String downloadUrl, String version,
   int versionCode, String logo, int downloadPercent,
   int downloadState, EnvLayerEntity envLayerEntity,
   boolean isDownloaded, int isSteam)
  ```
- `@NotNull` params: title, desc, value, fileMd5, fileName, downloadUrl, version, logo — must be `""` not `null`

#### Step 3: Understand reflection targets

**`ghl_inspect/smali_classes8/ComponentRepo.smali`**
- Default-package class `ComponentRepo`
- Primary constructor (7 params): `(String name, String version, State state, EnvLayerEntity entry, boolean isDep, boolean isBase, DependencyManager$Companion$Info depInfo)`
- Getters: `getEntry()` → EnvLayerEntity, `getName()` → String, `getVersion()` → String, `getState()` → State

**`ghl_inspect/smali_classes4/com/xj/winemu/api/bean/EnvLayerEntity.smali`**
- Primary constructor (18 params):
  ```
  (String blurb, String fileMd5, long fileSize, int id,
   String logo, String displayName, String name, String fileName,
   int type, String version, int versionCode, String downloadUrl,
   String upgradeMsg, SubData subData, EnvLayerEntity base,
   String framework, String frameworkType, int isSteam)
  ```
- Getters: `getId()`, `getType()`, `getDisplayName()`, `getName()`, `getVersion()`, `getVersionCode()`, `getLogo()`, `getBlurb()`, `getFileMd5()`, `getFileSize()`, `getFileName()`

**`ghl_inspect/smali_classes8/State.smali`**
- Enum: `Downloaded`, `Extracted`, `INSTALLED`, `NeedUpdate`, `None`
- Access: `Class.forName("State").getField("Extracted").get(null)`

**Content type integers (from PROGRESS_LOG init entry):**
- GPU Driver = 10, DXVK = 12, VKD3D = 13, Box64 = 94, FEXCore = 95
- TRANSLATOR = 32 (used by games requesting Box64/FEXCore — must match 94 and 95)

#### Step 4: Understand the correct BH 5.3.5 UI flow

Read screenshots provided by user:
- `Screenshot_20260319-081211.png` — main list: title "Banners Component Manager", "+ Add New Component", component names (vkd3d-2.12, base, dxvk-v2.4.1-async, ...), no "Download from Online Repos" at top level
- `Screenshot_20260319-081217.png` — type selection: "↓ Download from Online Repos", DXVK, VKD3D-Proton, Box64, FEXCore, "GPU Driver / Turnip", "← Back"

Read BH 5.3.5 smali (reference):
- `bannerhub/patches/smali_classes16/com/xj/landscape/launcher/ui/menu/ComponentManagerActivity.smali` — confirmed modes 0-3, type→int mapping, Remove All uses `.bh_injected` marker
- `bannerhub/patches/smali_classes16/com/xj/landscape/launcher/ui/menu/ComponentInjectorHelper.smali` — confirmed reflection approach for registration, `appendLocalComponents` logic

### What was built/changed

#### `extension/ComponentInjectorHelper.java` — NEW FILE

Full reflection-based component lifecycle manager. Key methods:

**`injectComponent(Context ctx, Uri uri, int contentType)`**
- Called from `ComponentManagerActivity` when user picks a file in mode=3 (new component)
- Opens URI, detects format by magic bytes (ZIP: PK=0x504B; zstd: 0x28B52FFD; XZ: 0xFD377A58)
- Extracts to `components/<displayName-strip-ext>/`
- Reads `profile.json` (WCP) or `meta.json` (ZIP) from destDir after extraction for name/version/desc
- If `profile.json` has a `name` field different from folder name → renames folder to canonical name
- Calls `registerComponent()`
- Stamps `.bh_injected` in destDir
- Toasts "Added to GameHub: <name>" on UI thread

**`injectFromCachedFile(Context ctx, File cachedFile, String folderName, int contentType)`**
- Called from `ComponentDownloadActivity` after download
- Same extraction + read profile + register + stamp flow, folder name pre-determined from asset filename

**`registerComponent(Context ctx, String name, String version, String desc, int contentType)`**
```java
// 1. Create EnvLayerEntity via reflection (18-param ctor)
Class<?> entityClass = Class.forName("com.xj.winemu.api.bean.EnvLayerEntity");
Constructor<?> entityCtor = findCtor(entityClass, 18); // finds by param count
Object entity = entityCtor.newInstance(
    desc, "", 0L, idHash, "", name, name, name,
    contentType, version, 0, "", "", null, null, "", "", 0);

// 2. Get State.Extracted
Class<?> stateClass = Class.forName("State");
Object stateExtracted = stateClass.getField("Extracted").get(null);

// 3. Create ComponentRepo via reflection (7-param ctor)
Class<?> repoClass = Class.forName("ComponentRepo");
Constructor<?> repoCtor = findCtor(repoClass, 7);
Object repo = repoCtor.newInstance(name, version, stateExtracted, entity, false, true, null);

// 4. Get EmuComponents singleton
Class<?> emuClass = Class.forName("com.xj.winemu.EmuComponents");
Object companion = emuClass.getField("c").get(null);   // EmuComponents$Companion
Object instance  = companion.getClass().getMethod("a").invoke(companion); // singleton

// 5. Register via C() — NOT B() (B sets state=Downloaded, reset to None by A())
Method cMethod = instance.getClass().getMethod("C", repoClass);
cMethod.invoke(instance, repo);
```

**`unregisterComponent(String name)`**
```java
// Calls EmuComponents.w(List<String>) — removes from HashMap + SharedPreferences atomically
Object emuInstance = getEmuComponentsInstance();
Method w = emuInstance.getClass().getMethod("w", java.util.List.class);
w.invoke(emuInstance, Collections.singletonList(name));
```

**`appendLocalComponents(List list, int contentType)`**
- Gets EmuComponents instance
- Gets HashMap field `a` via `getDeclaredField("a").setAccessible(true)`
- Iterates `map.values()` — each value is a `ComponentRepo`
- For each repo: get `EnvLayerEntity` via `getEntry()`, get its type via `getType()`
- `typeMatches(storedType, contentType)`:
  - exact match always true
  - if `contentType == TRANSLATOR (32)` → also matches `Box64 (94)` and `FEXCore (95)`
- Creates `DialogSettingListItemEntity` via 21-param ctor with entity's fields
- Adds to list
- Key fields passed: `isDownloaded=true`, `downloadState=3` (installed), `downloadPercent=100`

**`doExtract(InputStream raw, File destDir, int contentType)`**
- Reuses WcpExtractor logic (same magic byte detection, same obfuscated method calls)
- `extractTar()`: calls `f()` for getNextTarEntry, `p()` for getName (5.1.4 obfuscation)
- FEXCore detection: `contentType == TYPE_FEXCORE` → flattenToRoot=true; also detects from `profile.json` content
- `profile.json` written to destDir during extraction for `readProfile()` to consume
- ZIP: flat extraction via `java.util.zip.ZipInputStream` (no obfuscation needed)

#### `extension/ComponentManagerActivity.java` — COMPLETE REWRITE

Matches BH 5.3.5 UI exactly. Mode-based navigation:

| Mode | Screen | Items |
|------|--------|-------|
| 0 | Main list | "+ Add New Component" \| `<dir names>` \| "✕ Remove All Components" |
| 1 | Per-component options | "Inject/Replace file..." \| "Backup" \| "Remove" \| "← Back" |
| 2 | Type selection | "↓ Download from Online Repos" \| "DXVK" \| "VKD3D-Proton" \| "Box64" \| "FEXCore" \| "GPU Driver / Turnip" \| "← Back" |
| 3 | Awaiting file picker | (no UI, immediately opens file picker) |

Type → content type mapping:
```java
case 1: selectedType = TYPE_DXVK;       // 12
case 2: selectedType = TYPE_VKD3D;      // 13
case 3: selectedType = TYPE_BOX64;      // 94
case 4: selectedType = TYPE_FEXCORE;    // 95
case 5: selectedType = TYPE_GPU_DRIVER; // 10
```

`onActivityResult`:
- mode=3 (new component): background thread → `ComponentInjectorHelper.injectComponent(ctx, uri, type)` → `showComponents()`
- mode=1 (inject/replace into existing): `injectRaw(uri)` (raw file copy, no registration change)

Remove: calls `ComponentInjectorHelper.unregisterComponent(name)` before `deleteDir()`
Remove All: only deletes dirs that have `.bh_injected` marker file

#### `extension/ComponentDownloadActivity.java` — UPDATED

Key changes:
- Added `selectedContentType` field (int)
- `showCategories()` click handler now sets `selectedContentType = categoryToType(cat)`
- `categoryToType()` helper:
  ```java
  "DXVK"       → TYPE_DXVK       (12)
  "VKD3D"      → TYPE_VKD3D      (13)
  "Box64"      → TYPE_BOX64      (94)
  "FEXCore"    → TYPE_FEXCORE    (95)
  "GPU Driver" → TYPE_GPU_DRIVER (10)
  "All"        → TYPE_GPU_DRIVER (10) fallback
  ```
- `downloadAndInject()`: replaced `WcpExtractor.extractFromStream(fis, destDir)` + manual SP write with:
  ```java
  ComponentInjectorHelper.injectFromCachedFile(this, cacheFile, componentFolder, contentType);
  ```

#### `extension/WcpExtractor.java` — DELETED

All extraction logic absorbed into `ComponentInjectorHelper`. Removed to avoid dead code.

#### `.github/workflows/build-quick.yml` + `build.yml` — PATCH #8 ADDED

Smali injection into `GameSettingViewModel$fetchList$1.smali` (in `smali_classes4/`):

**Anchor (unique in file — verified by grep, appears once):**
```
    iget-object v0, v7, Lcom/xj/winemu/settings/GameSettingViewModel$fetchList$1;->$result:Lcom/xj/common/data/model/CommResultEntity;

    invoke-virtual {v0, v13}, Lcom/xj/common/data/model/CommResultEntity;->setData(Ljava/lang/Object;)V
```

**Replacement (prepends before the anchor):**
```
    iget v0, v7, Lcom/xj/winemu/settings/GameSettingViewModel$fetchList$1;->$contentType:I
    invoke-static {v13, v0}, Lapp/revanced/extension/gamehub/ComponentInjectorHelper;->appendLocalComponents(Ljava/util/List;I)V

    iget-object v0, v7, ...->$result:...;

    invoke-virtual {v0, v13}, ...->setData(...)V
```

**Why `v7` and `v13`:**
- `v7` = the lambda instance (`GameSettingViewModel$fetchList$1`), which holds `$contentType` as a field
- `v13` = the component list (`List<DialogSettingListItemEntity>`) built from the server API response, about to be passed to `setData()`
- `iget v0, v7, ...->$contentType:I` loads the int content type into v0
- `invoke-static {v13, v0}` calls `appendLocalComponents(list, contentType)` which mutates the list in-place before setData delivers it to the UI

**Why at line 2354 specifically:**
- This is the ONLY call to `setData()` in this file
- Located at the end of the suspend function's success branch (after API response processed)
- Injecting here guarantees local components merge into whatever the server returned (including empty list if offline)

### CI
- Run ID: 23295310207
- Duration: 2m 5s
- Result: ✅ success — all 8 patches applied, APK compiled, javac+d8 succeeded, signed
- Artifact: `Bannerhub-Lite-5.1.4-Normal.apk`

### Commits and pushes
- Commit: `d1a1a96` — "feat: EmuComponents registration + correct UI flow for v0.1.4-pre"
- `git push origin refs/heads/main`
- `git push origin refs/tags/v0.1.4-pre`
- Release description set via `gh release edit v0.1.4-pre --notes "..."`

---

## Appendix — Reference material

### EmuComponents 5.1.4 method map
| Method | Description |
|--------|-------------|
| `B(ComponentRepo)` | Sets state=Downloaded, calls C() — DO NOT USE (A() resets Downloaded→None) |
| `C(ComponentRepo)` | HashMap.put(name, repo) + SP.putString(name, gson) — USE THIS |
| `D()` | Full HashMap→SP save (all entries) |
| `A()` | Resets all Downloaded→None, calls D() — would destroy B()-registered components |
| `w(List<String>)` | Removes names from HashMap + SP — correct unregister |
| field `a` | `HashMap<String, ComponentRepo>` — the live registry |
| field `b` | `SharedPreferences` ("sp_winemu_all_components12") |
| field `c` (static) | `EmuComponents$Companion` — get companion, then call `.a()` for singleton |

### Content type integers
| Type | Int | Matches TRANSLATOR(32)? |
|------|-----|------------------------|
| GPU Driver | 10 | No |
| DXVK | 12 | No |
| VKD3D | 13 | No |
| TRANSLATOR | 32 | N/A — is the query type for Box64+FEXCore |
| Box64 | 94 | Yes |
| FEXCore | 95 | Yes |

### WCP/ZIP magic bytes
| Format | Magic bytes | Method |
|--------|-------------|--------|
| ZIP | 50 4B (PK) | `java.util.zip.ZipInputStream` (flat extraction) |
| WCP (zstd tar) | 28 B5 2F FD | `ZstdInputStreamNoFinalizer` + obfuscated TarArchiveInputStream |
| WCP (XZ tar) | FD 37 7A 58 | `XZInputStream` + obfuscated TarArchiveInputStream |

### 5.1.4 TarArchiveInputStream obfuscation
| Original method | Obfuscated name (5.1.4) |
|-----------------|------------------------|
| `getNextTarEntry()` | `f()` |
| `TarArchiveEntry.getName()` | `p()` |
| `read(byte[], int, int)` | `read(byte[], int, int)` (kept) |
| `close()` | `close()` (kept) |

### GameSettingViewModel$fetchList$1 register map
| Register | Contents |
|----------|----------|
| v7 | `this` (the lambda instance) |
| v13 | `List<DialogSettingListItemEntity>` from API |
| `$contentType` | int field on v7, the content type being queried |
