# BannerHub Lite — Progress Log

**Repo:** https://github.com/The412Banner/bh-lite
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
