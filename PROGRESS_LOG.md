# BannerHub Lite — Progress Log

**Repo:** https://github.com/The412Banner/Bannerhub-Lite
**Local path:** `/data/data/com.termux/files/home/bh-lite`
**Base APK:** GameHub Lite 5.1.4 (vanilla, non-ReVanced)
**Rules:** No pull requests. Log every change. Update MEMORY.md after every commit/push.

---

## Session — 2026-03-19

### [init] — Project created (2026-03-19)
**Commit:** (initial)

#### What changed
- Created bh-lite project: BannerHub feature port into GameHub Lite 5.1.4
- All features ported from BannerHub (5.3.5) except RTS (already in 5.1.4 base APK)

#### Features implemented
1. **My Games rename** — "Dashboard" tab → "My Games" (strings.xml Python patch)
2. **BCI launcher button** — `iv_bci_launcher` ImageView added to `ll_right_top_status` toolbar; click opens BannersComponentInjector (com.banner.inject) or shows toast; wired in `LandscapeLauncherMainActivity.initView()` via smali injection
3. **Component Manager (full)** — sidebar "Components" item → `ComponentManagerActivity`:
   - Inject WCP/ZIP/XZ file (with duplicate prevention)
   - Add New Component (creates empty folder with dialog)
   - Remove Component (with confirm dialog)
   - Remove All (with confirm dialog)
   - Backup to Downloads/BannerHub/
   - Download from Online Repos link
4. **ComponentDownloadActivity** — Online component downloader:
   - 8 repos: StevenMXZ, Arihany WCPHub, Xnick417x, AdrenoToolsDrivers (K11MCH1), Freedreno Turnip CI (whitebelyash), MaxesTechReview (MTR), HUB Emulators (T3st31), Nightlies by The412Banner
   - 2 fetch modes: GitHub Releases API + pack.json (flat JSON array)
   - Category filter: DXVK / VKD3D / Box64 / FEXCore / GPU Driver / All
5. **Offline Steam login skip** — `SteamGameByPcEmuLaunchStrategy$launch$1$3`: if user is not Steam-logged-in AND offline, skip login dialog and attempt offline launch
6. **Performance sidebar** (`BhPerfSetupDelegate`) — two `SidebarSwitchItemView` items added to `winemu_sidebar_controls_fragment.xml`:
   - Sustained Performance (Root+) — `setSustainedPerformanceMode` + CPU governor su -c
   - Max Adreno Clocks (Root) — `/sys/class/kgsl/kgsl-3d0/devfreq/min_freq` su -c
   - Root check: grey out at 0.5f alpha with no click listener if no root
   - `BhPerfSetupDelegate` extends View, self-wires via `onAttachedToWindow()`

#### 5.1.4 injection points (re-discovered from smali)
- `HomeLeftMenuDialog.Z0()` — before `MultiViewHolderAdapterKt.f(adapter, this.m)` (same as ghl-add)
- `HomeLeftMenuDialog$init$1$9$2.a(MenuItem)` — before `const-string v0, "entity"` (same as ghl-add)
- `LandscapeLauncherMainActivity.initView()` — before final `return-void` (before `.end method`, before `.method public final j3()V`)
- `SteamGameByPcEmuLaunchStrategy$launch$1$3` — after `invoke-interface ISteamGameService.l()Z / move-result v1`, before `if-nez v1, :cond_8`

#### Architecture
- Extension Java files compiled to `classes11.dex` (5.1.4 uses classes.dex–classes10.dex; no conflict)
- `BhPerfSetupDelegate` extends `android.view.View`, inflated in sidebar layout XML (zero-size, visibility=gone), self-wires on `onAttachedToWindow()`
- All GameHub-internal classes accessed via reflection
- `WcpExtractor`: obfuscated 5.1.4 methods: `getNextTarEntry()` → `f()`, `TarArchiveEntry.getName()` → `p()`

#### Files created
- `extension/ComponentManagerActivity.java`
- `extension/ComponentManagerHelper.java`
- `extension/ComponentDownloadActivity.java`
- `extension/WcpExtractor.java`
- `extension/BhPerfSetupDelegate.java`
- `patches/res/layout/llauncher_activity_new_launcher_main.xml`
- `patches/res/layout/winemu_sidebar_controls_fragment.xml`
- `.github/workflows/build.yml`
- `.github/workflows/build-quick.yml`
- `testkey.pk8`, `testkey.x509.pem`
- `PROGRESS_LOG.md`, `README.md`

---

### [fix] — v0.1.1-pre — invoke-static/range fix for BCI button (2026-03-19)
**Commit:** `cab5b01`  |  **Tag:** v0.1.1-pre  |  **CI:** ✅ success

#### What changed
- `LandscapeLauncherMainActivity.initView()` injection: changed `invoke-static {p0}` to `invoke-static/range {p0 .. p0}`
- Root cause: `initView()` has `.locals 21`; for a non-static method p0 = v21. The non-range `invoke-static` encoding only supports v0-v15 (4-bit register field); v21 triggers "Invalid register: v21. Must be between v0 and v15" smali assembler error.

#### Files touched
- `.github/workflows/build.yml`
- `.github/workflows/build-quick.yml`

---

### [fix] — v0.1.2-pre — Runtime fix: hidden API + diagnosis logs (2026-03-19)
**Commit:** `550b6a1`  |  **Tag:** v0.1.2-pre  |  **CI:** ✅ success

#### What changed
- `addComponentsMenuItem`: was using `ActivityThread.currentApplication()` (hidden API, blocked Android 9+) to get a Context. Changed to `dialog.getContext()` (public Fragment method). Also changed signature from `(List)` to `(Object, List)` — smali injection updated to pass `v0` (dialog) as first arg.
- Added `Log.d("BannerHub", ...)` entry-point log at start of `addComponentsMenuItem`, `handleMenuItemClick`, `setupBciButton` for runtime diagnosis.

#### Root cause analysis
- Logcat showed zero "BannerHub" log entries → extension code never ran, or ran and silently failed before even logging
- Hidden API `ActivityThread.currentApplication()` would throw `NoSuchMethodException` (caught, logged to "BannerHub" tag, but only if code reached that point)
- More likely: original GameHub Lite was installed (signature conflict — must uninstall first)

#### Files touched
- `extension/ComponentManagerHelper.java`
- `.github/workflows/build.yml`
- `.github/workflows/build-quick.yml`

---

### [fix] — v0.1.3-pre — List refresh + correct folder naming + T3st31 404 removed (2026-03-19)
**Commit:** `ef70a0d`  |  **Tag:** v0.1.3-pre  |  **CI:** ✅ success

#### What changed
- `ComponentManagerActivity`: added `onResume()` calling `showComponents()` — list now refreshes when returning from `ComponentDownloadActivity` (previously stayed stale, downloaded components appeared to vanish)
- `ComponentDownloadActivity.downloadAndInject`: replaced `guessComponentFolder()` with asset-name-based folder naming — strips extension so e.g. `Mesa_Turnip_26.1.0_R4.zip` → `components/Mesa_Turnip_26.1.0_R4/` instead of generic `gpu_driver/` (which overwrote every GPU driver download into the same folder)
- Removed T3st31/HUB Emulators from repo list — `T3st31/hub_emu` returns HTTP 404; uses rankings.json format not yet supported in bh-lite

#### Root cause analysis
- logcat: `E/BannerHub: fetchAndShowAssets failed — HTTP 404 for T3st31/hub_emu` (twice, separate threads)
- No `onResume()` → `ComponentManagerActivity` never re-called `showComponents()` on return from download
- `guessComponentFolder()` put all GPU drivers into `gpu_driver/`, cleared on every new download

#### Files touched
- `extension/ComponentManagerActivity.java`
- `extension/ComponentDownloadActivity.java`

---

### [feat] — v0.1.4-pre — EmuComponents registration + correct UI flow (2026-03-19)
**Commit:** `d1a1a96`  |  **Tag:** v0.1.4-pre  |  **CI:** ✅ success (run 23295310207, 2m 5s)

#### What changed
- **ComponentInjectorHelper** (NEW) — reflection-based component system:
  - `injectComponent(Context, Uri, int)`: extract WCP/ZIP/XZ, read profile.json/meta.json, register in EmuComponents, stamp `.bh_injected`
  - `injectFromCachedFile(Context, File, String, int)`: same for downloaded files
  - `registerComponent()`: creates `EnvLayerEntity` (18-param ctor) + `ComponentRepo` (7-param ctor) via reflection, calls `EmuComponents.C(ComponentRepo)` with Extracted state (not B() which sets Downloaded and would be reset by A())
  - `unregisterComponent(String)`: calls `EmuComponents.w(List<String>)` — removes from HashMap + SharedPreferences
  - `appendLocalComponents(List, int)`: iterates EmuComponents HashMap, creates `DialogSettingListItemEntity` (21-param ctor) for each BH-registered component matching the requested contentType; TRANSLATOR(32) matches Box64(94) and FEXCore(95)
- **ComponentManagerActivity** — complete rewrite matching BH 5.3.5 UI exactly:
  - Modes 0-3 navigation (main list → type selection → file picker)
  - Type selection: DXVK / VKD3D-Proton / Box64 / FEXCore / GPU Driver / ← Back
  - Per-component: Inject/Replace / Backup / Remove / ← Back
  - Remove All only deletes `.bh_injected`-stamped dirs
  - Calls `ComponentInjectorHelper.injectComponent()` for new components
- **ComponentDownloadActivity** — calls `ComponentInjectorHelper.injectFromCachedFile()` instead of WcpExtractor; tracks `selectedContentType` per category; added `categoryToType()` mapping
- **WcpExtractor.java** — deleted (extraction fully replaced by ComponentInjectorHelper)
- **build-quick.yml + build.yml** — added smali patch #8: inject `appendLocalComponents(v13, $contentType)` into `GameSettingViewModel$fetchList$1` before `setData(v13)` so locally registered components appear in game settings component pickers

#### Root cause analysis
- Components were only stored on disk as folders; never called `EmuComponents.B/C()` to register in GameHub's in-memory HashMap or SharedPreferences
- `GameSettingViewModel$fetchList$1` only fetched from server API; no injection point for local components
- ComponentManagerActivity UI (Add New Component → text dialog) did not match BH 5.3.5 flow (type selection → file picker)

#### Key smali facts discovered
- `EmuComponents.B(ComponentRepo)` sets state to Downloaded (wrong — gets reset by A()); use `C()` directly with Extracted state
- `EmuComponents.C(ComponentRepo)` = HashMap.put(name, repo) + SharedPreferences.putString(name, gson)
- `EmuComponents.w(List<String>)` = HashMap.remove(name) + SharedPreferences.remove(name) for each
- `GameSettingViewModel$fetchList$1.$contentType` (int field on lambda) = content type being fetched
- v13 in the lambda = List of `DialogSettingListItemEntity` about to be set as data
- `DialogSettingListItemEntity` 21-param ctor mapping documented in ComponentInjectorHelper

#### Files touched
- `extension/ComponentInjectorHelper.java` (new)
- `extension/ComponentManagerActivity.java`
- `extension/ComponentDownloadActivity.java`
- `extension/WcpExtractor.java` (deleted)
- `.github/workflows/build-quick.yml`
- `.github/workflows/build.yml`


---

### [feat] — v0.1.5-pre — Repos match BannerHub exactly (2026-03-19)
**Commit:** `ec341fd`  |  **Tag:** v0.1.5-pre  |  **CI:** ✅ success (run 23296902845, 2m 10s)

#### What changed
- Replaced 7 GitHub Releases API repos with the exact 6 repos BannerHub uses:
  - Arihany WCPHub (`WinlatorWCPHub/pack.json`)
  - Kimchi GPU Drivers (`Nightlies/kimchi_drivers.json`)
  - StevenMXZ GPU Drivers (`Nightlies/stevenmxz_drivers.json`)
  - MTR GPU Drivers (`Nightlies/mtr_drivers.json`)
  - Whitebelyash GPU Drivers (`Nightlies/white_drivers.json`)
  - The412Banner Nightlies (`Nightlies/nightlies_components.json`)
- All repos now use pack.json format — removed `MODE_GITHUB` constant, `Repo.mode` field, and `fetchGithubReleases()` method
- Updated README repo table with correct source links

#### Files touched
- `extension/ComponentDownloadActivity.java`
- `README.md`

---

### [fix] — v0.1.7-pre — Pre-release package name fix (banner.hub.lite) (2026-03-19)
**Commit:** `71f5bbc`  |  **Tag:** v0.1.7-pre  |  **CI:** ✅ success (run 23298246088, 1m 45s)

#### What changed
- Moved "Patch package name and label" step to **before** apktool rebuild in `build-quick.yml`
  - Previously this step ran after `apktool b`, so sed changes to `apktool_out/AndroidManifest.xml` had zero effect on the compiled APK
  - Both the package name change AND the label "BannerHub Lite" were silently being dropped every build
- Added `sed -i 's/gamehub\.lite/banner.hub.lite/g'` — pre-release APK now installs as `banner.hub.lite`
  - Coexists with any stable `gamehub.lite` install without conflict
  - FileProvider authority also updated (the sed covers all occurrences in AndroidManifest.xml)

#### Root cause
`apktool b` compiles `AndroidManifest.xml` into binary XML inside the APK during rebuild. Any sed run after rebuild modifies the source file on disk but the APK binary is unaffected. Fix: run sed before `apktool b`.

#### Files touched
- `.github/workflows/build-quick.yml`

---

### [fix] — v0.1.8-pre — Game cards now launch (tap + controller A button) (2026-03-19)
**Commit:** `2411183`  |  **Tag:** v0.1.8-pre  |  **CI:** ✅ success (run 23299680499, 1m 40s)

#### What changed
- Patched `LauncherHelper$fetchStartTypeInfoAndSwitchModeInternal$2$1.smali`
- In the `:goto_9` exception handler, removed the `instance-of`/`if-eqz` check for `NetUnknownHostException`
- All exceptions (including `ConvertException` from HTTP 404) now return `true` (proceed with current settings) instead of `false` (block launch)

#### Root cause (confirmed via logcat)
`fetchStartTypeInfoAndSwitchModeInternal` calls two backend APIs before allowing any game to launch:
1. `devices/getUnknownDevices` — checks if hardware is recognized
2. `/vtouch/startType` — fetches recommended launch configuration

Both return HTTP 404 on the AYANEO Pocket FIT because:
- Device not on GameHub hardware whitelist → GENERIC adapter path
- Controller reports `isGamepad:false` → gamepad shortcut skipped
- API has no data for this device

`GsonConverter` tries to parse `404` (HTTP status code returned as body) as JSON → `JSONException` → `ConvertException`. Exception handler only returned `true` for `NetUnknownHostException`, `false` for everything else → launch silently blocked every time. This affected both touch and controller since the API call happens before either input is processed.

#### Files touched
- `.github/workflows/build-quick.yml`
- `.github/workflows/build.yml`
