# BannerHub Lite — Component Manager Build Log

**Repo:** https://github.com/The412Banner/Bannerhub-Lite
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

## Entry 006 — Skip GPU driver download when System Driver selected (v0.2.4-pre)

### Problem (user-reported after v0.2.3-pre)
When adding a new game, GameHub tries to download Turnip (GPU driver from game config) repeatedly and fails with "already downloaded more than once, incorrect behavior, interrupt" error in logcat. Game launch blocked.

### Root cause analysis

#### WinEmuDownloadManager.H() = `checkUserPreferComponent`

Signature: `H(String gameId, EnvLayerEntity entity, Set downloadSet, EnvLayerEntity container, Continuation)`

Method builds the pending download list. For each game config component, it checks the user's preference:
- **STEAMCLIENT branch (lines 2226-2238):** Calls `P0()` → if null or `getId() == -1` → jump to `:cond_f` (return false, skip). If real selection → pass `entity.getName()` to `downloadUserSelectAfterRecommend`.
- **GPU branch (original, lines 2079-2094):** Calls `H0()` → if null → `v3 = null`; if non-null → `v3 = H0().getName()` = `"System Driver"` (set by GpuDefaultHelper). Passes `"System Driver"` to `downloadUserSelectAfterRecommend`.

#### WinEmuDownloadManager.Z() = `downloadUserSelectAfterRecommend`

Signature: `Z(Set, String preferredName, EnvLayerEntity, int, Continuation)`

- If `preferredName` is non-null and non-empty → calls `EmuComponents.n(preferredName)` to get ComponentRepo
  - If `n()` returns null (no such component in registry) → logs "本地没有用户选择的组件" → falls through to recommended download: calls `EmuComponents.q(entity.getName())` — if q() = "not installed" → adds to download set
  - If `n()` non-null → checks if installed, downloads if not
- If `preferredName` is null or empty → same recommended-download fallback

#### Why "System Driver" caused Turnip downloads

`GpuDefaultHelper` (patch 15) correctly wrote a `PcSettingDataEntity(id=-1, name="System Driver")` to the per-game GPU pref. When `checkUserPreferComponent` ran, `H0()` returned non-null, so `v3 = "System Driver"`. Then `downloadUserSelectAfterRecommend("System Driver", turnipEntity)` called `EmuComponents.n("System Driver")` → returned null (System Driver is not a real EmuComponent, it's the built-in GPU). Fallback: `EmuComponents.q("Turnip_v26.1.0_R4")` → not installed → added to download set. Turnip downloaded, but `checkIsDownloaded$2` has no GPU fileType case → returns false → `checkNextStartTask` sees key in `f` map → fires "more than once" abort.

#### Download loop explanation

1. Turnip added to pending set → downloads successfully
2. `checkAllComplete` → `checkIsDownloaded("Turnip")` → false (no GPU fileType case)
3. `checkNextStartTask` → Turnip key already in `f` → `F()` → abort. But if not yet in `f`, `c1()` restarts → second download → third attempt → final abort. Logcat shows 3 full downloads before crash.

### Fix

Patched the GPU block in `checkUserPreferComponent` to mirror the STEAMCLIENT check:
- After `H0()`: if null → `:cond_f` (skip, not `:cond_8` with null name)
- If `getId() == -1` (System Driver) → `:cond_f` (skip)
- If real driver selected → use `entity.getName()` (same as STEAMCLIENT branch, not H0().getName())

| Register | Before fix | After fix |
|----------|-----------|-----------|
| p1 after H0() | `PcSettingDataEntity` or null | same |
| null check | `if-eqz p1, :cond_8` (pass null name → recommended download) | `if-eqz p1, :cond_f` (skip entirely) |
| id check | (none) | `getId(); if id==-1, :cond_f` |
| v3 (preferred name) | `H0().getName()` = `"System Driver"` | `entity.getName()` (the game config component's actual name) |

### Files modified
- `apktool_out_local/smali_classes4/com/xj/winemu/download/WinEmuDownloadManager.smali`
- `.github/workflows/build-quick.yml` (patch 16)
- `.github/workflows/build.yml` (patch 16)

### CI result
- ✅ success (run 23307656790)

---

## Entry 007 — checkIsDownloaded$2 else-branch fix for GPU driver (v0.2.5-pre)

### Problem (user-reported after v0.2.4-pre)
Turnip still downloads on every new game add and launch still fails with "more than once, interrupt."

### Root cause analysis

#### Why Patch 16 didn't prevent the download
Patch 16 patched `WinEmuDownloadManager.H()` (= `checkUserPreferComponent`) to return TRUE (skip) for GPU entities when System Driver is selected. This works for the **getComponent() loop** in collectGameConfigs$1. However, Turnip is also present in the game config's **getDeps() list**. The getDeps() loop (lines 3529-3589) calls `EmuComponents.q(name)` directly — it never calls H() at all. Since Turnip is not in EmuComponents, q() says "needs download" → Turnip added to download set regardless of Patch 16.

#### checkIsDownloaded$2 else-branch bug
After Turnip downloads (successfully, md5 matches), `checkAllComplete` calls `checkIsDownloaded(turnipEntity)`. The entity's `getFileType()` is not 2, 3, or 4 (those are EmuContainers, EmuImageFs, EmuComponents types) — it's the GPU driver's server-provided fileType, which falls through to the `else` branch.

Original else branch:
```smali
goto :goto_4  # v4=0 → returns FALSE = "not downloaded"
```

`FALSE` = "still needs download" → `checkNextStartTask` adds Turnip to "still needed" list → checks if key is in `f` map (it is, download just completed) → calls `F()` → "more than once, interrupt" → abort.

If Turnip's key is NOT yet in `f`: `c1(id, false)` restarts the download → second download → same loop → third download → F() fires. This explains the 3-download cycle in logcat.

#### Fix
Changed else branch from `goto :goto_4` to `goto :goto_1`. At `:goto_1`: `move v4, v5` = v4=1, then `goto :goto_4` → `Boxing.a(1)` = TRUE = "already downloaded." checkAllComplete sees all items done → fires onAllComplete → game launch proceeds.

| Branch | Old | New |
|--------|-----|-----|
| fileType == 4 (EmuComponents) | q() → TRUE if installed | unchanged |
| fileType == 3 (EmuImageFs) | C() | unchanged |
| fileType == 2 (EmuContainers) | B() | unchanged |
| else (GPU driver, unrecognised) | `:goto_4` → FALSE | `:goto_1` → TRUE |

### Files modified
- `apktool_out_local/smali_classes4/com/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2.smali`
- `.github/workflows/build-quick.yml` (patch 17)
- `.github/workflows/build.yml` (patch 17)

### CI result
- ✅ success (run 23334942958)

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

---

## Entry 009 — Fix VerifyError crash when opening Advanced settings tab (v0.2.8-pre)

### Root cause
`SettingBtnHolder.w()` was patched to inject the Grant Root Access handler at `:cond_5` (the end of the method). Two verifier violations caused a crash every time the Advanced settings tab was opened:

1. **p2 is not a View at `:cond_5`** — `p2` was overwritten with an int (the `getCONTENT_TYPE_HID_TIPS()` result via `move-result p2`) before `:cond_5` is reached. Calling `invoke-virtual {p2}, View->getContext()` on an int register is a type error.

2. **Type-merge conflict at `:goto_0`** — `if-ne p0, p1, :goto_0` sends `p0` (int/contentType) to `:goto_0`, but earlier `goto :goto_0` branches arrive there with `p0` as Object (event instances). The verifier sees `Conflict` for `p0` at the merge point.

### Fix
Moved the injection to immediately after `move-result p0` (the `getContentType()` result), before any registers are overwritten. At that point: `p0`=int, `p1`=entity(Object), `p2`=FocusableConstraintLayout(View). Used `v0` as comparison register. Returns `kotlin.Unit` directly — never jumps to `:goto_0`, eliminating the merge conflict entirely.

### Files touched
- `apktool_out_local/smali_classes5/.../SettingBtnHolder.smali`
- `.github/workflows/build-quick.yml` — Patch 21 anchor + logic rewritten
- `.github/workflows/build.yml` — Patch 21 anchor + logic rewritten

### CI result
✅ Success — run 23337088171 — 1m36s

---

## Entry 008 — Settings Grant Root Access button + remove perf-menu root popup (v0.2.7-pre)

### Problem
`BhPerfSetupDelegate.onAttachedToWindow()` called `isRootAvailable()` which ran `su -c id` every time the in-game Performance sidebar opened, triggering the root manager popup. User wanted: no popup on menu open; instead a dedicated Settings → Advanced button to grant root access with a thorough warning.

### Root cause
`isRootAvailable()` unconditionally runs a blocking `su -c id`. This was fine for a one-time check at BannerHub startup but is disruptive when called on every sidebar open.

### Fix

#### Part A — `BhPerfSetupDelegate.java`
Changed `boolean hasRoot = isRootAvailable();` to `boolean hasRoot = prefs.getBoolean("root_granted", false);`. Performance toggles now read root state from `bh_prefs` without running su. The `isRootAvailable()` method is kept but no longer called on menu open.

#### Part B — `BhRootGrantHelper.java` (new extension class)
Static method `requestRoot(Context)`:
- If root already granted: shows dialog to revoke (sets `root_granted=false`).
- If not granted: shows a 5-point warning dialog explaining Sustained Performance Mode, Max Adreno Clocks, root risks, device compatibility, and battery impact. "Grant Access" button runs `su -c id` on a background thread, stores result in `bh_prefs`, shows Toast.

#### Part C — Smali patches (Patches 19/20/21)

**Patch 19 — `SettingItemViewModel.k()`:**
Added a third `SettingItemEntity` (TYPE_BTN=3, contentType=0x64) after the existing CLEAR_CACHE item. Uses the same register layout (v9=Companion, v10-v16=init args, mask=0xc). `0x64` is above the highest existing contentType (0x17) to avoid collisions.

**Patch 20 — `SettingItemEntity.getContentName()`:**
At the final else block (`:cond_15`), checks `v0 == 0x64` → returns `"Grant Root Access"`. Falls through to `:cond_16` for any other unknown types which still return `""`.

**Patch 21 — `SettingBtnHolder.w()`:**
Before `:goto_0` (the no-op fall-through), checks `p0 == 0x64`. If match: calls `p2.getContext()` (p2 = FocusableConstraintLayout, a View subclass) → passes context to `BhRootGrantHelper.requestRoot()`. Uses only param registers (no extra `.locals` needed).

### Files created/modified
- `extension/BhPerfSetupDelegate.java` — 1 line changed (isRootAvailable() → prefs read)
- `extension/BhRootGrantHelper.java` — new file (100 lines)
- `apktool_out_local/smali_classes5/com/xj/landscape/launcher/vm/SettingItemViewModel.smali` — Patch 19
- `apktool_out_local/smali_classes5/com/xj/landscape/launcher/data/model/entity/SettingItemEntity.smali` — Patch 20
- `apktool_out_local/smali_classes5/com/xj/landscape/launcher/ui/setting/holder/SettingBtnHolder.smali` — Patch 21
- `.github/workflows/build-quick.yml` — Patches 19/20/21
- `.github/workflows/build.yml` — Patches 19/20/21

### CI result
✅ Success — run 23336597590 — 1m44s

---

## Entry 012 — Fix GOG depot manifest: 'items' key + DepotItem type filter (v0.3.3-pre)

### Commit
`05f8a67`  |  **Tag:** v0.3.3-pre

### Files touched
- `extension/GogDownloadManager.java` — `parseDepotManifest()` key fix

### Root cause analysis
Previous fix used `depot.optJSONArray("files")` but the real GOG v2 depot manifest structure is `{ "depot": { "items": [...] } }`. The key is `"items"`, not `"files"`. Also, directory/symlink filtering used `optBoolean("directory")` which is always false — entries actually use `"type": "DepotDir"` / `"DepotLink"`. Fixed to only collect entries where `type == "DepotItem"`.

### CI result
✅ Success — run 23513735563

---

## Entry 011 — Fix GOG Gen2 depot manifest parsing: 0 files bug + compressedMd5 (v0.3.3-pre)

### Commit
`51b848f`  |  **Tag:** v0.3.3-pre

### Files touched
- `extension/GogDownloadManager.java` — `parseDepotManifest()` two-bug fix

### Root cause analysis
`parseDepotManifest()` called `root.optJSONArray("depot")` but the real GOG v2 depot manifest structure is `{ "depot": { "files": [ ... ] } }` — `depot` is a JSONObject, not an array. `optJSONArray` returned null immediately, yielding 0 files from every depot, causing the Gen2 download path to always fall back to the installer exe.

Secondary bug: chunk hash key was `"md5"` but CDN chunk URL construction requires `"compressedMd5"`. Fixed to prefer `compressedMd5`, falling back to `md5`.

### Fix applied
- `root.optJSONArray("depot")` → `root.optJSONObject("depot").optJSONArray("files")`
- `chunk.optString("md5")` → `chunk.optString("compressedMd5")` with `md5` fallback

### CI result
✅ Success — run 23512613663 (superseded by Entry 012)

---

## Entry 010 — Full GOG Games Integration (v0.3.3-pre)

### Commit
`fde7a57` — v0.3.3-pre — 2026-03-23

### What was added
Port of BannerHub 5.3.5 GOG Games integration to BannerHub Lite 5.1.4 as Java extension classes (all compiled into classes11.dex via javac+d8).

### New Java files
| File | Purpose |
|---|---|
| `GogGame.java` | Data class: gameId, title, imageUrl, description, developer, category, generation |
| `GogInstallPath.java` | Static helper: `{filesDir}/gog_games/{dirName}` |
| `GogTokenRefresh.java` | Blocking GET to auth.gog.com/token; updates bh_gog_prefs |
| `GogLoginActivity.java` | WebView OAuth2 implicit flow; intercepts on_login_success fragment; fetches userData.json; saves tokens + loginTime/expiresIn |
| `GogMainActivity.java` | Entry point: login card / logged-in card; View Library → GogGamesActivity; Sign Out |
| `GogGamesActivity.java` | Scrollable game cards; library sync (user/data/games + products/{id}); proactive token refresh; Gen badge; ✓ Installed checkmark; ProgressBar; Install/Add/Uninstall; Copy to Downloads |
| `GogDownloadManager.java` | Gen 2 pipeline (manifest → depots → CDN → chunk+inflate → assembly); Gen 1 fallback (byte-range); copyToDownloads() |

### Modified files
- `extension/ComponentManagerHelper.java` — GOG_MENU_ID=10; addComponentsMenuItem() adds "GOG Games"; handleMenuItemClick() routes ID=10 → GogMainActivity
- `.github/workflows/build.yml` — register GogMainActivity, GogLoginActivity, GogGamesActivity in AndroidManifest patch
- `.github/workflows/build-quick.yml` — same manifest additions

### Key design decisions
- All code as Java extension classes (no new smali needed — same approach as all existing bh-lite features)
- Implicit OAuth2 flow (response_type=token) — tokens arrive in redirect URL fragment; no token exchange request needed
- GOG credentials: public embedded client (46899977096215655 / 9d85c43b...) documented in open-source GOG Galaxy
- Install path: `{filesDir}/gog_games/{installDirectory}` (mirrors BannerHub 5.3.5)
- Gen 2 + Gen 1 fallback; zlib inflate for Gen 2 chunks, byte-range for Gen 1
- Copy to Downloads → `Downloads/GOG Games/{dirName}` via Environment.getExternalStoragePublicDirectory
- "Add to Launcher" shows exe path + manual instructions (standalone Activity cannot call EditImportedGameInfoDialog which requires FragmentActivity)

### CI result
✅ Success — run 23455679718
