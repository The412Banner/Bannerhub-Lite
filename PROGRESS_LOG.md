# BannerHub Lite — Progress Log

**Repo:** https://github.com/The412Banner/Bannerhub-Lite
**Local path:** `/data/data/com.termux/files/home/bh-lite`
**Base APK:** GameHub Lite 5.1.4 (vanilla, non-ReVanced)
**Rules:** No pull requests. Log every change. Update MEMORY.md after every commit/push.

---

### [stable] — v0.3.5 — GOG 3-view modes + SteamGridDB covers + poster layout (2026-03-25)
**Commit:** `70f483c`  |  **Tag:** v0.3.5  |  **CI:** ✅ (8 APKs)
#### What changed
- **3-way view toggle** (List / Grid / Poster), saved to `view_mode` SP key
- **Grid view**: 5-col tiles 105dp, gen badge top-left, title+✓ overlay, tap→action row, long-press→detail dialog
- **Poster view**: 5-col tiles 176dp tall, dp(16) margins, movie poster proportions
- **SteamGridDB cover art**: 600×900 vivid portrait covers fetched on sync; fallback GOG icon→background
- **Html.fromHtml** description in detail dialog — strips raw HTML tags
- **A-Z sort** in all modes; long-press→detail dialog on grid/poster tiles
#### Files touched
- `extension/GogGamesActivity.java`, `README.md`

---

### [feat] — v0.3.5-pre — 5-col grid: gen badge, title overlay, tap→action row (2026-03-25)
**Commit:** `74913a2`  |  **Tag:** v0.3.5-pre  |  **CI:** ✅
#### What changed
- **5-column grid** (redesigned from 3-col): matches GameNative Epic tab aesthetic
- **Art frame** (FrameLayout, 105dp tall): `images.background` landscape art as cover (CENTER_CROP), falls back to `images.icon`
- **Gen badge** top-left overlay: "Gen 1" (orange) / "Gen 2" (blue), 8sp, rounded bg
- **Title + ✓ bar** pinned to bottom of art: gradient overlay (bottom black→transparent), 9sp bold, ellipsize END; green ✓ shown if installed
- **Action row** slides out below art on tap (GONE→VISIBLE): thin 3dp ProgressBar + Install/Add to Launcher button (30dp tall, 10sp); auto-collapses previously expanded tile
- **View toggle** button in header: `⊞` (list mode) / `☰` (grid mode); saved to `view_mode` SP key
- **List view** = v0.3.4 style (60×60 icon, collapsible cards, inline install controls)
- **A-Z sort** on every `showGames()` call (both modes)
#### Files touched
- `extension/GogGamesActivity.java`

---

### [feat] — v0.3.5-pre (abandoned) — Fancy banner card UI: landscape art + gradient overlay (2026-03-25)
**Commit:** `f7df7c8`  |  **Tag:** v0.3.5-pre (overwritten by retag)
#### What changed
- Full-width 140dp landscape banner image; gradient overlay; rounded buttons; A-Z sort
- Abandoned: user found images looked faded due to gradient overlay; replaced with list/grid toggle
#### What changed
- Card redesign: full-width 140dp landscape banner image at top of each card (was 60×60 icon thumbnail)
- Image source flipped: prefer `images.background` (landscape art) over `images.icon` (square icon)
- Dark gradient overlay (transparent→opaque bottom) on banner so title/badge/arrow are readable over the image
- Gen badge, title, ✓ indicator, and arrow now live inside the gradient overlay bar
- Card has rounded corners (10dp) + subtle border + `setClipToOutline(true)` so banner image clips to card shape
- Action button (Install/Add to Launcher) now has rounded corners (8dp `GradientDrawable`) instead of flat color
- Button color changed to `0xFF5C35CC` (richer purple) for Install state
- `pct%` and status text combined into a single horizontal progress row
- Alphabetical A-Z sort applied on every `showGames()` call
- `uninstall()` restores rounded button background correctly
#### Files touched
- `extension/GogGamesActivity.java`

---

### [release] — v0.3.4 — Stable: search bar + collapsible cards + installed indicator (2026-03-25)
**Commit:** `ed2f590`  |  **Tag:** v0.3.4  |  **CI:** ✅ (8 APKs)
#### What changed
- Stable release of all v0.3.4-pre work: real-time search bar, collapsible cards, tappable arrow, collapsed ✓ indicator
- README updated with new GOG card UX description
#### Files touched
- README.md

---

### [fix] — v0.3.4-pre — Fix ✓ position: immediately after title text (2026-03-25)
**Commit:** `73cb52c`  |  **Tag:** v0.3.4-pre  |  **CI:** ✅ run 23534241324 (1m37s)
#### What changed
- `titleTV` changed to `WRAP_CONTENT` + `ellipsize=END`; `collapsedCheckTV` sits right after it; `titleSpacer` with `weight=1` fills remaining space so arrow stays far right
#### Files touched
- `extension/GogGamesActivity.java`

---

### [fix] — v0.3.4-pre — Move collapsed ✓ next to game title (2026-03-25)
**Commit:** `c91cda4`  |  **Tag:** v0.3.4-pre  |  **CI:** ✅ run 23533990664 (1m38s)
#### What changed
- `collapsedCheckTV` moved from `topRow` into `titleRow` so it sits immediately after the title text
#### Files touched
- `extension/GogGamesActivity.java`

---

### [feat] — v0.3.4-pre — Installed indicator on collapsed cards (2026-03-25)
**Commit:** `fef7b6b`  |  **Tag:** v0.3.4-pre  |  **CI:** ✅ run 23533810297 (1m38s)
#### What changed
- Green ✓ `collapsedCheckTV` added to always-visible header row; shown when `gog_exe_` pref exists
- Also shown immediately in `onComplete` callback when install finishes
#### Files touched
- `extension/GogGamesActivity.java`

---

### [feat] — v0.3.4-pre — Tappable arrow to collapse card (2026-03-25)
**Commit:** `787c4d5`  |  **Tag:** v0.3.4-pre  |  **CI:** ✅ run 23533616267 (1m41s)
#### What changed
- `arrowTV` gets its own `OnClickListener` — tapping ▲ collapses the card without triggering the detail dialog
- Resets `expandedSection`/`expandedArrow` to null on collapse
#### Files touched
- `extension/GogGamesActivity.java`

---

### [feat] — v0.3.4-pre — Collapsible game cards (2026-03-25)
**Commit:** `3c19a6f`  |  **Tag:** v0.3.4-pre  |  **CI:** ✅ run 23533324089 (1m43s)
#### What changed
- Cards start collapsed: cover art + Gen badge + title + ▼ arrow only
- First tap expands: reveals category/developer, checkmark, progress bar, status, Install/Add button; arrow → ▲
- Tap on already-expanded card opens detail dialog (Uninstall / Copy to Downloads)
- Only one card expanded at a time; new card tap auto-collapses previous
- `expandedSection` + `expandedArrow` fields track current expanded card
#### Files touched
- `extension/GogGamesActivity.java`

---

### [feat] — v0.3.4-pre — Real-time search bar in GOG library (2026-03-25)
**Commit:** `0d9cd27`  |  **Tag:** v0.3.4-pre  |  **CI:** ✅ run 23532830022 (1m43s)
#### What changed
- Search bar (EditText) added below header in `GogGamesActivity`; filters game list per keystroke via `TextWatcher`
- `applyFilter(query)` does case-insensitive contains match on title, re-renders matching cards only
- `allGames` field stores full unfiltered list; search state preserved when background sync refreshes
#### Files touched
- `extension/GogGamesActivity.java`

---

### [release] — v0.3.3 — Stable: Full GOG Games tab (2026-03-24)
**Commit:** `f7d38d4`  |  **Tag:** v0.3.3  |  **CI:** ✅ (8 APKs)
#### What changed
- Stable release cutting all v0.3.3-pre work: full GOG Games tab (OAuth2, Gen2/Gen1/installer download, library cache, parallel sync, refresh button, cover art, percentage, Add Game flow, Uninstall, Copy to Downloads, path normalization)
- README updated: GOG tab marked live, full feature description updated
#### Files touched
- README.md

---

### [feat] — v0.3.3-pre — GOG library cache + parallel fetches + refresh button (2026-03-24)
**Commit:** `b462b1c`  |  **Tag:** v0.3.3-pre
#### What changed
- Cache: game list saved to SharedPrefs (`gog_library_cache`) after every sync; renders instantly on next open while background sync runs silently
- Parallel fetches: 5-thread `ExecutorService` for per-game metadata + generation checks (~3-5x speedup)
- Refresh (↺) button added to header; disabled during sync, re-enabled on completion
- Extracted `fetchGame()` helper; added `showGames()`, `loadCachedGames()`, `saveCachedGames()`, `enableRefresh()`
#### Files touched
- `extension/GogGamesActivity.java`

---

### [fix] — v0.3.3-pre — Add Game navigates to dashboard immediately; uninstall resets card (2026-03-24)
**Commit:** `f394751`  |  **Tag:** v0.3.3-pre
#### What changed
- `GogMainActivity.onResume()`: if `pending_gog_exe` is set, call `finish()` immediately — cascades back to `LandscapeLauncherMainActivity` where `checkPendingLaunch` fires `g3()`
- `uninstall()`: now also resets `actionBtn` to "Install" (purple, enabled) on UI thread after deletion
- `showDetailDialog` + `uninstall` now accept `actionBtn` parameter
#### Files touched
- `extension/GogMainActivity.java`
- `extension/GogGamesActivity.java`

---

### [fix] — v0.3.3-pre — Don't auto-trigger EditImportedGameInfoDialog after install (2026-03-24)
**Commit:** `44be31e`  |  **Tag:** v0.3.3-pre
#### What changed
- After install completes: show "✓ Installed" + set button to "Add Game" (green), do nothing else
- "Add Game" tap (and existing "Add to Launcher") both call `triggerLaunch` → `pending_gog_exe` → `finish()` → `onResume` → `g3()`
- Removed auto-`triggerLaunch` call on `onComplete`
#### Files touched
- `extension/GogGamesActivity.java`

---

### [fix] — v0.3.3-pre — fix: remove DepotItem type filter, skip by empty path/chunks (2026-03-24)
**Commit:** `abc293e`  |  **Tag:** v0.3.3-pre
#### What changed
- Removed `!"DepotItem".equals(type)` guard — actual GOG type string unknown, was skipping all entries
- Now filters by `path.isEmpty() || chunks == null || chunks.length() == 0` only
#### Files touched
- `extension/GogDownloadManager.java`

---

### [fix] — v0.3.3-pre — fix: GOG depot manifest 'items' key + DepotItem type filter (2026-03-24)
**Commit:** `05f8a67`  |  **Tag:** v0.3.3-pre
#### What changed
- `parseDepotManifest()`: `depot.optJSONArray("files")` → `depot.optJSONArray("items")` — GOG v2 format uses `items` not `files`
- Directory filter: `optBoolean("directory")` → `!"DepotItem".equals(type)` — GOG uses type strings not boolean flag
#### Files touched
- `extension/GogDownloadManager.java`

---

### [fix] — v0.3.3-pre — fix: GOG Gen2 depot manifest 0-files bug + compressedMd5 (2026-03-24)
**Commit:** `51b848f`  |  **Tag:** v0.3.3-pre
#### What changed
- `parseDepotManifest()`: `root.optJSONArray("depot")` → `root.optJSONObject("depot").optJSONArray("files")` — depot is a JSONObject wrapper, not an array
- Chunk hash: prefer `compressedMd5` over `md5` for CDN URL construction
#### Files touched
- `extension/GogDownloadManager.java`

---

### [pre] — v0.3.3-pre — feat: auto-fire EditImportedGameInfoDialog after GOG install (2026-03-24)
**Commit:** `0e74759`  |  **Tag:** v0.3.3-pre  |  **CI:** ✅ run 23493840256

#### What changed
- **GogLaunchHelper.java** (new) — `triggerLaunch(Activity, exePath)`: saves `pending_gog_exe` to SharedPrefs + calls `finish()` to return to main activity; `checkPendingLaunch(Activity)`: reads pref, invokes `g3(exePath)` via reflection on `LandscapeLauncherMainActivity` → opens `EditImportedGameInfoDialog` with path pre-filled, clears pref
- **GogGamesActivity.java** — `onComplete()` now calls `GogLaunchHelper.triggerLaunch()` instead of showing "Add to Launcher" manual instructions dialog; detail dialog "Launch / Add" button also calls `triggerLaunch` directly; `showAddDialog()` removed
- **build.yml + build-quick.yml** — new smali patch: inject `GogLaunchHelper.checkPendingLaunch(Activity)` call after `super.onResume()` in `LandscapeLauncherMainActivity.onResume()`

#### Files touched
- `extension/GogLaunchHelper.java` (new)
- `extension/GogGamesActivity.java`
- `.github/workflows/build.yml`
- `.github/workflows/build-quick.yml`

---

### [pre] — v0.3.3-pre — fix(gog): installer fallback — manualUrl typo + multi-hop redirect (2026-03-24)
**Commit:** `dc2ceea`  |  **Tag:** v0.3.3-pre  |  **CI:** ✅ run 23492458134

#### What changed
- **GogDownloadManager.java** — two bugs fixed in `runInstaller()`:
  1. `f.optString("downlink")` was called twice (copy-paste); second call now correctly uses `"manualUrl"` — file-level `manualUrl` was never checked as fallback
  2. `resolveRedirect()` followed only 1 hop; updated to follow up to 5 hops; also handles GOG API endpoints that return `200 {"downlink":"..."}` JSON (api.gog.com/products/{id}/downlinks/*) instead of a 302 redirect

#### Status: UNTESTED — installer fallback still needs real-device verification

#### Files touched
- `extension/GogDownloadManager.java`

---

## [docs] — v0.3.3-pre — Thorough README rewrite with heat disclaimer (2026-03-23)
**Commit:** `153c649`  |  **Tag:** v0.3.3-pre (docs only, no CI)
**What changed:** Full README rewrite. Added Table of Contents. Every feature section expanded: GOG tab covers all three download pipelines, Component Manager covers card UI/actions/registration flow, Performance toggles have prominent heat/damage disclaimer and accurate technical explanation (sysfs KGSL min_freq, setSustainedPerformanceMode, CPU governor — both root-only, greyed out without root). Added RTS gesture table, CPU affinity presets table, GPU default, launch fix, FAQ (6 questions), How It Works (classes11 dex injection), Build Info.
**Files touched:** `README.md`
**CI result:** N/A (docs-only commit)

---

### [pre] — v0.3.3-pre — feat(gog): installer fallback for old GOG games (2026-03-23)
**Commit:** `7d1992b`  |  **Tag:** v0.3.3-pre  |  **CI:** ✅ (APK compiled; upload finalize glitch, published manually)

#### What changed
- **GogDownloadManager.java** — installer fallback pipeline for GOG games with no content-system builds:
  - `runGen1` now returns `"NO_CS_BUILDS"` sentinel when `total_count==0` (distinguishes true empty from API error)
  - `doDownload` detects `NO_CS_BUILDS` → calls `runInstaller()`
  - `runInstaller()`: `GET api.gog.com/products/{id}?expand=downloads` → parse `installers[].files[].downlink` (or `manualUrl`) for Windows installer → `resolveRedirect()` follows GOG /downloader/get/... redirect → `downloadWithProgress()` streams .exe with live progress
  - `resolveRedirect()`: handles relative GOG manual URLs (prepends `https://www.gog.com`), follows one redirect hop
  - `downloadWithProgress()`: streams with 32KB buffer, reports `onProgress` percent from Content-Length
  - Error message improved: shows `"No downloadable builds for this game"` instead of raw API JSON
- **Debug infrastructure** (from earlier commits in this session, still present):
  - `writeDebug()` writes full diagnostic to `getExternalFilesDir/bh_gog_debug.txt`
  - Builds API response snippet shown in error message
  - `runGen2`/`runGen1` return `String?` instead of `boolean` (null=success)

#### Root cause discovered
All user's library games (Gunslugs, Residual, Saints Row 2, Stargunner, etc.) are old pre-Galaxy GOG games — `content-system.gog.com builds?generation=1/2` returns `{"total_count":0,"items":[]}` for all of them. Installer fallback is needed for this library.

#### Status: UNTESTED — installer fallback not yet verified working
- Need to confirm: `api.gog.com/products/{id}?expand=downloads` response structure (`downlink` vs `manualUrl` field names)
- Need to confirm: redirect chain works correctly for GOG installer URLs
- Need to confirm: installer .exe actually downloads and shows in GameHub

#### Files touched
- `extension/GogDownloadManager.java`

---

### [pre] — v0.3.3-pre — fix(gog): correct download pipeline API hosts + depot manifest (2026-03-23)
**Commit:** `325e4b0`  |  **Tag:** v0.3.3-pre  |  **CI:** ✅ run 23456432070 (APK uploaded; duplicate release cleaned up manually)

#### What changed
- **GogDownloadManager.java** — 5 download pipeline bugs fixed:
  1. builds URL: `api.gog.com` → `content-system.gog.com` (Gen 1 + Gen 2) — root cause of "no builds" error
  2. secure_link URL: `www.gog.com` → `content-system.gog.com`; use `baseProductId` from `products[0].productId`
  3. depot `manifest` field is a hash, not a URL; build CDN URL: `gog-cdn-fastly.gog.com/content-system/v2/meta/<hash[0:2]>/<hash[2:4]>/<hash>`
  4. language filter: add `"en"` and `"english"` checks alongside `"en-US"` and `"*"`
  5. exe detection: read `temp_executable` from `manifest.products[0]` first; fall back to recursive scan

#### Files touched
- `extension/GogDownloadManager.java`

---

### [pre] — v0.3.3-pre — feat(gog): full GOG Games integration (2026-03-23)
**Commit:** `fde7a57`  |  **Tag:** v0.3.3-pre  |  **CI:** ✅ run 23455679718

#### What changed
- **GogGame.java** — data class (gameId, title, imageUrl, description, developer, category, generation)
- **GogInstallPath.java** — static `{filesDir}/gog_games/{dirName}`
- **GogTokenRefresh.java** — blocking GET to auth.gog.com/token; updates bh_gog_prefs
- **GogLoginActivity.java** — WebView OAuth2 implicit flow; intercepts on_login_success redirect; parses access_token/refresh_token/user_id from URL fragment; fetches username from userData.json; saves to bh_gog_prefs including loginTime + expiresIn
- **GogMainActivity.java** — side-menu entry point; login card / logged-in card; View Library → GogGamesActivity; Sign Out clears prefs
- **GogGamesActivity.java** — scrollable game cards; proactive token refresh; library sync via user/data/games + products/{id}?expand=downloads,description; Gen badge (1=orange/2=blue); ✓ Installed checkmark; ProgressBar + status text; Install/Add/Uninstall buttons; detail dialog with Copy to Downloads
- **GogDownloadManager.java** — Gen 2 pipeline (builds API → manifest → depot manifests → CDN via secure_link → chunk download + zlib inflate → file assembly); Gen 1 fallback (byte-range download); copyToDownloads() → Downloads/GOG Games/
- **ComponentManagerHelper.java** — GOG_MENU_ID=10 added; addComponentsMenuItem() adds "GOG Games" menu item; handleMenuItemClick() routes ID=10 → GogMainActivity
- **build.yml + build-quick.yml** — register GogMainActivity, GogLoginActivity, GogGamesActivity in AndroidManifest patch

#### Files touched
- `extension/GogGame.java` (new)
- `extension/GogInstallPath.java` (new)
- `extension/GogTokenRefresh.java` (new)
- `extension/GogLoginActivity.java` (new)
- `extension/GogMainActivity.java` (new)
- `extension/GogDownloadManager.java` (new)
- `extension/GogGamesActivity.java` (new)
- `extension/ComponentManagerHelper.java` (modified)
- `.github/workflows/build.yml` (modified)
- `.github/workflows/build-quick.yml` (modified)

---

### [release] — v0.3.2 — Stable: Component Manager + Downloader UI upgrade + dynamic APK naming (2026-03-23)
**Commit:** `1480819`  |  **Tag:** v0.3.2  |  **CI:** ✅ run 23442891841 (8 APKs)

#### What changed
- Stable release cutting all changes from v0.3.1-pre
- README updated to reflect new Component Manager card UI and Downloader navigation
- CI: APK files now named `Bannerhub-Lite-vX.Y.Z-<Variant>.apk` (dynamic from tag)
- CI: `versionName` in built APK now matches repo tag (e.g. `0.3.2`) via `apktool.yml` sed patch

---

### [feat] — v0.3.1-pre — Component Manager + Downloader UI upgrade to BannerHub style (2026-03-23)
**Commit:** `8308819`  |  **Tag:** v0.3.1-pre  |  **CI:** ✅ run 23441811893 (1m46s, Normal APK)

#### What changed
- **ComponentManagerActivity.java** — full redesign matching BannerHub 5.3.5 style:
  - Dark theme (0xFF0D0D0D) persistent layout
  - Header: ← back, orange title "Banners Component Manager", grey count badge, red ✕ All button (hidden when 0 bh dirs)
  - Search bar (EditText) with live TextWatcher → `applyFilter()` into `filteredComponents[]`
  - Card-style `ListView` via `ComponentCardAdapter` (BaseAdapter): colored accent strip, name + source line (from `banners_sources` SP), type badge (GradientDrawable per-type color), arrow ›
  - Empty state TextView
  - Bottom bar: + Add New (showTypeDialog) | ↓ Download (ComponentDownloadActivity) — explicit 48dp height
  - `showOptionsDialog` / `showTypeDialog` AlertDialogs replace mode-based list navigation
  - `cleanSP(name)`: removes 4 SP keys on remove (name, name:type, url_for:name, dl:url)
  - `getTypeName` / `getTypeColor`: keyword detection + DXVK/VKD3D/Box64/FEX/GPU/WCP color map
- **ComponentDownloadActivity.java** — full redesign matching BannerHub 5.3.5 style:
  - Persistent layout built once in `onCreate` (never rebuilt)
  - Dark theme, orange header with ← back, grey `mStatusText` updating per mode
  - Hidden `ProgressBar` shown during fetch/download
  - `DarkAdapter extends BaseAdapter` (white 15sp text, 48dp min height)
  - Mode 0→1→2: repo → category → asset list
  - Fetch once per repo into `mAllNames`/`mAllUrls`, filter by type per category click
  - ✓ prefix for already-downloaded assets via `banners_sources` SP "dl:url" key
  - `writeSourceSP()`: 4 SP entries (name→repo, dl:url→"1", name:type, url_for:name)
  - `findNewDir()`: timestamp-scan for newly created component dir post-inject
  - `detectType(String)`: keyword-based filename → type int

#### Files touched
- `extension/ComponentManagerActivity.java`
- `extension/ComponentDownloadActivity.java`

---

### [release] — v0.3.0 — First stable release (2026-03-20)
**Commit:** `aaf1f88`  |  **Tag:** v0.3.0  |  **CI:** ✅ success (run 23345254370, 8 APKs)

#### What changed
- Stable tag cut from v0.2.8-pre (commit `f1575b7`) — all features and fixes from v0.1.1-pre through v0.2.8-pre included
- README rewritten to cover all features: CPU affinity, VRAM limits, root access, launch fix, GPU default, component manager, online downloader, performance toggles
- Release description set with full feature set + installation guide

---

### [fix] — v0.2.8-pre — VerifyError crash when opening Advanced settings tab (2026-03-20)
**Commit:** `f1575b7`  |  **Tag:** v0.2.8-pre  |  **CI:** ✅ success (run 23337088171)

#### What changed
- **Patch 21 (`SettingBtnHolder.w()`):** Fixed `VerifyError` crash that caused a crash-to-dashboard every time Advanced settings tab was opened. Root cause: injection at `:cond_5` used `p2` (already overwritten to int) as a View, and `if-ne p0, p1, :goto_0` created a type-merge conflict at `:goto_0`. Fix: moved injection immediately after `getContentType()`'s `move-result p0`, before any register overwriting, using `v0` as comparison register. Returns Unit directly — no jump to `:goto_0`.

#### Files touched
- `apktool_out_local/smali_classes5/.../SettingBtnHolder.smali`
- `.github/workflows/build-quick.yml`, `.github/workflows/build.yml`

---

### [feat] — v0.2.7-pre — Settings: Grant Root Access button + remove perf-menu root popup (2026-03-20)
**Commit:** `c43363d`  |  **Tag:** v0.2.7-pre  |  **CI:** ✅ success (run 23336597590)

#### What changed
- **BhPerfSetupDelegate.java:** Removed `isRootAvailable()` call on performance sidebar open. Now reads `bh_prefs["root_granted"]` instead — no root popup when opening the Performance menu.
- **BhRootGrantHelper.java (new):** `requestRoot(Context)` shows a warning dialog with 5 caveats (sustained performance mode, max adreno clocks, root risks, device compat, battery) before running `su -c id`. Stores `root_granted` in prefs. If already granted: shows revoke option instead.
- **Patch 19 — `SettingItemViewModel.k()`:** Adds a new TYPE_BTN entry (contentType=0x64) after Clear Cache in the Advanced settings list.
- **Patch 20 — `SettingItemEntity.getContentName()`:** Returns `"Grant Root Access"` for contentType 0x64.
- **Patch 21 — `SettingBtnHolder.w()`:** On click for contentType 0x64, calls `BhRootGrantHelper.requestRoot(context)`.

#### Files touched
- `extension/BhPerfSetupDelegate.java`, `extension/BhRootGrantHelper.java` (new)
- `apktool_out_local/smali_classes5/...SettingItemViewModel.smali`
- `apktool_out_local/smali_classes5/...SettingItemEntity.smali`
- `apktool_out_local/smali_classes5/...SettingBtnHolder.smali`
- `.github/workflows/build-quick.yml`, `.github/workflows/build.yml`

---

### [fix] — v0.2.6-pre — Fix "more than once" crash when custom GPU driver is selected (2026-03-20)
**Commit:** `ec02225`  |  **Tag:** v0.2.6-pre  |  **CI:** ✅ success (run 23335618978)

#### What changed
- **Patch 18 — `checkIsDownloaded$2` fileType==4 GPU check:** Before the `EmuComponents.q()` call for fileType==4 entities, check `entity.getType() == ComponentType.GPU`. If so, jump directly to `:goto_1` (return TRUE = "done"), bypassing q() entirely. GPU drivers are stored in xj_downloads after download, never registered in EmuComponents, so q() always returned "needs install" → FALSE → abort loop.

#### Why v0.2.5-pre still failed with custom driver
Patch 17 fixed the `else` branch (unrecognised fileType). With System Driver, only the getDeps()-Turnip is in the download set, and it has an unrecognised fileType → Patch 17 covers it. With a custom driver, there's ALSO a getComponent()-Turnip entry. `downloadUserSelectAfterRecommend` may call `setFileType(4)` on it before adding to the set. For fileType==4, Patch 17 doesn't apply — instead EmuComponents.q() is called, Turnip is not registered → q() returns "not installed" → checkIsDownloaded returns FALSE → abort.

#### Files touched
- `apktool_out_local/smali_classes4/com/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2.smali`
- `.github/workflows/build-quick.yml` (patch 18)
- `.github/workflows/build.yml` (patch 18)

---

### [fix] — v0.2.5-pre — Fix "more than once" crash for GPU driver downloads (2026-03-20)
**Commit:** `c2631b6`  |  **Tag:** v0.2.5-pre  |  **CI:** ✅ success (run 23334942958)

#### What changed
- **Patch 17 — `GameConfigDownloadAction$checkIsDownloaded$2`:** The `else` branch (fileType != 2/3/4) now jumps to `:goto_1` (returns TRUE = "done") instead of `:goto_4` (returns FALSE = "not downloaded"). GPU driver entities from getDeps() have an unrecognised fileType, so checkIsDownloaded always returned FALSE even after a successful md5-verified download → checkNextStartTask saw the key in the `f` map → "more than once, interrupt" abort. Fix: treat any unrecognised fileType as "downloaded" so checkAllComplete can proceed.

#### Why Patch 16 alone didn't fix it
Patch 16 fixed the getComponent() path (H() returns TRUE for GPU with System Driver → entity skipped). But Turnip also enters via the **getDeps() loop** (lines 3529-3589 of collectGameConfigs$1), which calls EmuComponents.q() directly and bypasses H() entirely. Since Turnip is not in EmuComponents, it gets queued. After download, checkIsDownloaded's else case returned FALSE → re-queue loop → crash.

#### Files touched
- `apktool_out_local/smali_classes4/com/xj/winemu/download/action/GameConfigDownloadAction$checkIsDownloaded$2.smali`
- `.github/workflows/build-quick.yml` (patch 17)
- `.github/workflows/build.yml` (patch 17)

---

### [fix] — v0.2.4-pre — Skip GPU driver download when System Driver is selected (2026-03-19)
**Commit:** `7d2b74b`  |  **Tag:** v0.2.4-pre  |  **CI:** ✅ success (run 23307656790)

#### What changed
- **Patch 16 — WinEmuDownloadManager.H() (= `checkUserPreferComponent`):** When building the pending download list for a new game, the GPU branch now mirrors the STEAMCLIENT branch: if `H0()` returns null OR `H0().getId() == -1` (System Driver), jump immediately to `:cond_f` — returning false without adding the GPU entity to the download set.
  - Previously: `H0().getName()` = `"System Driver"` was passed as the preferred name to `downloadUserSelectAfterRecommend`. `EmuComponents.n("System Driver")` returned null (System Driver is not a real EmuComponent), so it fell through to the "recommended download" path and queued Turnip. After Turnip downloaded, `checkIsDownloaded$2` returned false (GPU fileType has no case), so `checkNextStartTask` re-queued it → second download → "already downloaded more than once, interrupt" abort.
  - Fix: when the user has explicitly chosen System Driver (id=-1, set by GpuDefaultHelper), skip the GPU entry entirely — same logic GameHub already uses for STEAMCLIENT with id=-1.

#### Root cause
`WinEmuDownloadManager.H()` had a GPU-specific check that obtained the user's preference via `H0()` but then passed the preference's display name (`"System Driver"`) to `downloadUserSelectAfterRecommend`. Since `"System Driver"` is not a real component in the EmuComponents registry, `n("System Driver")` returned null → recommended (Turnip) was queued regardless of the user's System Driver selection. The "more than once" crash is a downstream symptom.

#### Files touched
- `apktool_out_local/smali_classes4/com/xj/winemu/download/WinEmuDownloadManager.smali` (GPU block in `checkUserPreferComponent$1`)
- `.github/workflows/build-quick.yml` (patch 16)
- `.github/workflows/build.yml` (patch 16)

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

---

### [feat] — v0.1.9-pre — CPU affinity bitmask + extended VRAM limits 6/8/12/16 GB (2026-03-19)
**Commit:** `d6bff01`  |  **Tag:** v0.1.9-pre  |  **CI:** ✅ success (run 23302752900, 1m 40s)

#### What changed
Patches 9–13b added to both `build-quick.yml` and `build.yml`:

- **Patch 9 — EnvironmentController.d():** Removed consecutive-core bitmask calculation (CpuInfoCollector total - selected count → shl/sub/not chain). Config.x() stored value is now used directly as the `WINEMU_CPU_AFFINITY` bitmask. 0 = No Limit (full set of cores).

- **Patch 10 — PcGameSettingOperations.F():** Replaced count-based CPU core loop (CpuInfoCollector enumeration) with 11 fixed bitmask presets:
  - No Limit (0x0), Cores 4-7 Performance (0xF0), Cores 0-3 Efficiency (0x0F)
  - Core 0 (0x1), Core 1 (0x2), Core 2 (0x4), Core 3 (0x8)
  - Core 4 (0x10), Core 5 (0x20), Core 6 (0x40), Core 7 Prime (0x80)
  - Uses {v8..v32} ctor range (5.1.4 has 25-param ctor vs 5.3.5's 26-param). Kotlin default mask = 0x1ffff2.

- **Patch 11 — PcGameSettingOperations.I():** Replaced "X cores" format-string label with bitmask name lookup. All 11 presets return their name string. Unknown bitmasks fall through to `Integer.toHexString()`.

- **Patch 12 — PcGameSettingOperations.p0():** Appended 6 GB (0x1800), 8 GB (0x2000), 12 GB (0x3000), 16 GB (0x4000) entries after the existing 4 GB (0x1000) entry in the VRAM selector list. Each entry calls M0()I fresh to check the current stored value for the selected highlight. Uses {v3..v27} ctor range, v28=1 for isSelected=true.

- **Patch 13a — PcGameSettingOperations.L0():** Added 4 if-eq checks for 0x1800/0x2000/0x3000/0x4000 before the "No Limit" fallback in the VRAM display label method.

- **Patch 13b — PcGameSettingOperations.L0():** Added :cond_bh6/:cond_bh8/:cond_bh12/:cond_bh16 handlers with `goto :goto_0` after :cond_4 (512 MB) to prevent fallthrough.

#### Files touched
- `.github/workflows/build-quick.yml` (patches 9–13b added)
- `.github/workflows/build.yml` (patches 9–13b added)

---

### [fix] — v0.2.0-pre — CPU label: dynamic "Core X + Core Y" builder for custom bitmask combinations (2026-03-19)
**Commit:** `8c972dd`  |  **Tag:** v0.2.0-pre  |  **CI:** ✅ success (run 23303634211, 1m 44s)

#### What changed
- Updated `PcGameSettingOperations.I()` replacement (Patch 11) in both workflow files
- The `:goto_0` fallback for unrecognized bitmask values was `Integer.toHexString(p1)` — now replaced with BannerHub's exact StringBuilder-based label builder
- For any bitmask not matching the 11 fixed presets, the builder iterates each bit (Core 0–7) and appends "Core N" with " + " separator when length > 0
- e.g. `0b10010001` → "Core 0 + Core 4 + Core 7 (Prime)"

#### Root cause
BannerHub's D() method (5.3.5) uses a bitwise label builder for custom combinations (lines 1893–2005). v0.1.9-pre used `Integer.toHexString()` as a placeholder fallback.

#### Files touched
- `.github/workflows/build-quick.yml`
- `.github/workflows/build.yml`

---

### [feat] — v0.2.1-pre — CPU core selector: individual checkbox popup (matches BannerHub exactly) (2026-03-19)
**Commit:** `de987ba`  |  **Tag:** v0.2.1-pre  |  **CI:** ✅ success (run 23304363996, 1m42s)

#### What changed
- **Patch 14 — SelectAndSingleInputDialog$Companion.f():** When `contentType == CONTENT_TYPE_CORE_LIMIT`, intercept before the normal `OptionsPopup` dropdown is built and call `CpuMultiSelectHelper.show()` instead, then `return-void`. The dropdown list never shows; the checkbox dialog is shown directly.

- **CpuMultiSelectHelper.java (NEW):** Java extension class ported from BannerHub's `CpuMultiSelectHelper.smali`. Shows an `AlertDialog.Builder.setMultiChoiceItems()` dialog with 8 individual checkboxes:
  - Core 0–3: Efficiency; Core 4–6: Performance; Core 7: Prime
  - Pre-checks boxes based on current stored bitmask (reads via reflection: `PcGameSettingDataHelper.w()` → ops → `PcGameSettingOperations.H()`)
  - Apply: builds new bitmask from checked boxes; validates at least 1 core; 0xFF → 0 (all = No Limit); writes via `SPUtils.m()`
  - No Limit: writes 0 directly
  - Cancel: no-op
  - Dialog sized to widthPixels/2 × heightPixels×90%
  - All GameHub classes accessed via reflection (5.1.4 obfuscated names)

#### Root cause
v0.2.0-pre CPU selector still used the dropdown list (DialogSettingListItemEntity-based). BannerHub shows a completely different UI — an AlertDialog with 8 individual checkboxes, one per core. This is the exact same behaviour as BannerHub.

#### Files touched
- `extension/CpuMultiSelectHelper.java` (new)
- `.github/workflows/build-quick.yml` (patch 14)
- `.github/workflows/build.yml` (patch 14)

---

### [fix] — v0.2.2-pre — CPU selector: UI refreshes immediately on Apply/No Limit (2026-03-19)
**Commit:** `94dfc26`  |  **Tag:** v0.2.2-pre  |  **CI:** ✅ success (run 23305291571, 1m43s)

#### What changed
- `CpuMultiSelectHelper.java`: after writing bitmask via `SPUtils.m()`, now calls `fireCallback(callback, mask)` in both Apply and No Limit handlers
- `fireCallback()`: invokes `callback.getClass().getMethod("invoke", Object.class).invoke(callback, entity)` — matches BannerHub `CpuMultiSelectHelper$2.onClick()` which calls `Function1.invoke(DialogSettingListItemEntity)`
- `buildEntity(int id)`: creates minimal entity via Kotlin defaults constructor (id=mask, isSelected=true, all other params defaulted). Dynamically finds the defaults ctor (params + int mask + DefaultConstructorMarker) so it works for any version.

#### Root cause
`callback` (`Function1<DialogSettingListItemEntity, Unit>`) was never invoked after saving. The RecyclerView adapter has no other way to know a value changed — it only updates on callback invocation. Without this, the label stayed stale until the ViewModel re-fetched the list on next entry.

#### Files touched
- `extension/CpuMultiSelectHelper.java`

---

### [feat] — v0.2.3-pre — GPU driver auto-default to System Driver for new games (2026-03-19)
**Commit:** `2d63c2b`  |  **Tag:** v0.2.3-pre  |  **CI:** ✅ success (run 23306310779, 2m5s)

#### What changed
- **GpuDefaultHelper.java (NEW):** Ensures new games always default to System Driver.
  - `ensureSystemDriver(Object ops)`: called via reflection entry; calls `H0()` on the passed `PcGameSettingOperations` — if GPU driver is already set, returns immediately. Otherwise gets per-game SPUtils via `h0()`, builds a `PcSettingDataEntity(id=-1, name=systemDriverLabel)` via Kotlin defaults constructor, serializes to JSON via `GsonUtils.j()`, and writes to per-game key `"pc_ls_GPU_DRIVER_"` via `SPUtils.o(key, json)`.
  - `buildSystemDriverEntity()`: dynamically finds `PcSettingDataEntity` Kotlin defaults ctor; sets `id=-1` (System Driver sentinel) and `name` from `getSystemDriverName()`; default mask = `(1<<numRealParams)-1 & ~0x3` (all defaults except id and name).
  - `getSystemDriverName()`: uses `Utils.a()` to get app context; resolves string resource `pc_gpu_official_driver`; falls back to `"System Driver"`.

- **Patch 15 — PcGameSettingDataHelper.x():** Injected `invoke-static {p1}, GpuDefaultHelper;->ensureSystemDriver(Object)V` immediately before `return-object p1`. `x()` is called by `computeIfAbsent` in `w(gameId)` — exactly once per game per session when a new `PcGameSettingOperations` instance is first created, making it the ideal injection point.

#### Root cause
When a game is added for the first time, no per-game GPU driver key exists in SPUtils. `getSelectGpuOrDefault()` falls back to the global `"pc_d_gpu"` preference which may point to a custom driver that was previously downloaded but no longer exists. `H0()` returns null, the fallback also fails, and GameHub crashes on launch. Fix: write System Driver (id=-1) to the per-game key on first session initialization, so `H0()` always returns non-null and the global fallback is never consulted.

#### Files touched
- `extension/GpuDefaultHelper.java` (new)
- `.github/workflows/build-quick.yml` (patch 15)
- `.github/workflows/build.yml` (patch 15)
