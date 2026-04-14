# BannerHub Lite

A modified build of **[GameHub Lite 5.1.4](https://github.com/Producdevity/gamehub-lite)** with BannerHub features ported in — GOG, Amazon, and Epic Games Store tabs, Component Manager, in-app component downloader, Export/Import Game Config, Wine Task Manager with Launch tab, Winlator HUD overlay (Normal + Extra Detailed), performance toggles, CPU core affinity, VRAM unlock, offline Steam skip, root access management, and more. Built with apktool + compiled Java extension (no source code from GameHub).

## AI Disclaimer

All smali edits, patches, and code changes in this project are developed with the assistance of **[Claude AI Sonnet 4.6](https://www.anthropic.com/claude)** by Anthropic. Claude is used to write, review, and modify smali bytecode and Java extension code since this project has no source code to work from — all changes are applied directly to the decompiled APK via apktool.

Before any stable release is published, all changes are manually debugged and tested by me across multiple devices — both rooted and unrooted. Debugging is done using logcat output and in-app debug log files to diagnose and verify behavior before changes are finalized.

---

## Table of Contents

- [BannerHub Lite vs BannerHub](#bannerhub-lite-vs-bannerhub)
- [Installation](#installation)
- [Features](#features)
  - [GOG Games Tab](#gog-games-tab)
  - [Amazon Games Tab](#amazon-games-tab)
  - [Epic Games Store Tab](#epic-games-store-tab)
  - [Component Manager](#component-manager)
  - [Online Component Downloader](#online-component-downloader)
  - [BCI Launcher Button](#bci-launcher-button)
  - [Export / Import Game Config](#export--import-game-config)
  - [Wine Task Manager](#wine-task-manager)
  - [Winlator HUD Overlay](#winlator-hud-overlay)
  - [Performance Sidebar Toggles](#performance-sidebar-toggles)
  - [RTS Touch Controls](#rts-touch-controls)
  - [VRAM Limit Unlock](#vram-limit-unlock)
  - [Per-Game CPU Core Affinity](#per-game-cpu-core-affinity)
  - [GPU System Driver Default](#gpu-system-driver-default)
  - [Offline Steam Launch](#offline-steam-launch)
  - [Launch Fix (Hardware Whitelist Bypass)](#launch-fix-hardware-whitelist-bypass)
  - [Settings: Advanced Tab](#settings-advanced-tab)
  - [Controller Navigation](#controller-navigation)
  - [UI Tweaks](#ui-tweaks)
- [How It Works](#how-it-works)
- [FAQ](#faq)
- [Credits](#credits)
- [Build Info](#build-info)

---

## BannerHub Lite vs BannerHub

Both projects add the same core set of features on top of different GameHub base APKs.

| | BannerHub Lite (this) | [BannerHub](https://github.com/The412Banner/bannerhub) |
|---|---|---|
| **Base app** | GameHub Lite 5.1.4 — vanilla, no ReVanced | GameHub 5.3.5 — ReVanced |
| **APK size** | ~47 MB | ~138 MB |
| **RTS touch controls** | Built into 5.1.4 — no patch needed | Patched in |
| **GPU System Driver default** | Yes | No |
| **Launch fix (hardware whitelist bypass)** | Yes | No |
| **Component description in game settings picker** | Not yet | Yes |
| **Community Game Configs browser** | Not yet | Yes |
| **Konkr Style HUD** | Not yet | Yes |
| **Sustained Perf toggle behavior** | `setSustainedPerformanceMode` + CPU governor (root) | CPU governor only (root) |
| **GOG Games tab** | Yes | Yes |
| **Amazon Games tab** | Yes | Yes |
| **Epic Games Store tab** | Yes | Yes |
| **Export / Import Game Config** | Yes | Yes |
| **Wine Task Manager (Apps/Procs/Launch)** | Yes | Yes |
| **Winlator HUD (Normal + Extra Detailed)** | Yes | Yes |
| **Controller D-pad navigation** | Yes | Yes |
| **Component Manager** | Yes | Yes |
| **Online Component Downloader** | Yes (6 repos) | Yes (6 repos) |
| **CPU Core Affinity** | Yes | Yes |
| **Extended VRAM limits** | Yes (up to 16 GB) | Yes (up to 16 GB) |
| **Performance toggles** | Yes (root required) | Yes (root required) |
| **Grant Root Access button** | Yes | Yes |
| **Offline Steam skip** | Yes | Yes |
| **BCI launcher button** | Yes | Yes |

**Choose BannerHub Lite** if you are running GameHub Lite 5.1.4 (the most common community build) and want a smaller, vanilla base without a ReVanced dependency.

**Choose BannerHub** if you are running GameHub 5.3.5 ReVanced and want the latest codebase features.

---

## Installation

### Choosing your APK

9 APK variants are built — pick the one matching the package name of your existing GameHub Lite installation.

| APK | Package | App label |
|-----|---------|-----------|
| Normal | `banner.hub.lite` | BannerHub Lite |
| Normal(GHL) | `gamehub.lite` | BannerHub Lite |
| PuBG | `com.tencent.ig` | BannerHub Lite PuBG |
| AnTuTu | `com.antutu.ABenchMark` | BannerHub Lite AnTuTu |
| alt-AnTuTu | `com.antutu.benchmark.full` | BannerHub Lite AnTuTu |
| PuBG-CrossFire | `com.tencent.tmgp.cf` | BannerHub Lite PuBG CrossFire |
| Ludashi | `com.ludashi.aibench` | BannerHub Lite Ludashi |
| Genshin | `com.miHoYo.GenshinImpact` | BannerHub Lite Genshin |
| Original | `com.xiaoji.egggame` | BannerHub Lite |

### Steps

1. **Uninstall** your existing GameHub Lite — BannerHub Lite is signed with AOSP testkey (a different certificate) and cannot update over the original
2. Download the correct variant APK from [Releases](../../releases)
3. Install and launch

> Your game library, containers, and settings are stored in app data. They will be lost on uninstall unless you back them up first.

---

## Features

### GOG Games Tab

Accessible via the left side menu → **GOG**.

#### Authentication

- **OAuth2 login** — a WebView opens GOG's standard authorization page. The access token is stored in `bh_gog_prefs` SharedPreferences
- **Auto token refresh** — expiry is checked before every API call; silent refresh issued if expired. Manual re-login is never required unless you uninstall
- **Login persistence** — your session survives restarts and reboots

#### Library

- **Instant load from cache** — the library is cached after every sync and displayed immediately on next open. A background sync runs silently to update it
- **↺ Refresh button** — in the top-right of the library header; forces a fresh full sync
- **Parallel sync** — game metadata and generation checks are fetched on a 5-thread pool (~3–5x faster than sequential)
- **Real-time search bar** — filters the game list by title on every keystroke; no network calls, works entirely on the cached in-memory list
- **3 view modes** — toggle button in the top-right of the library header cycles between List, Grid, and Poster. Your preference is saved across sessions
  - **List**: collapsible cards (60×60 cover icon, gen badge, title, ✓, ▼ arrow). Tap to expand install controls; tap expanded card → detail dialog; tap ▲ to collapse. One card expanded at a time
  - **Grid**: 5-column tile layout (105dp art). Gen badge top-left, title + ✓ bar at bottom. Tap → action row slides out (Install / Add to Launcher + progress bar). Long-press → detail dialog
  - **Poster**: same as grid with 176dp tall portrait cards and wider gaps — movie poster proportions. Pairs with SteamGridDB cover art
- **SteamGridDB cover art** — grid and poster tiles fetch vivid 600×900 portrait covers from SteamGridDB on library sync; cached so no repeated API calls; falls back to GOG icon then background if not found
- **Installed indicator** — a green ✓ on every view mode so install status is visible at a glance

#### Download Pipeline

BannerHub Lite supports three download methods depending on the age of the game:

**Generation 2 (Galaxy-era games):**
1. Fetches the build manifest from GOG's content-system API
2. Downloads and parses the depot manifest to get the full file list (paths normalized for Android)
3. Downloads each file chunk-by-chunk; per-file filename + speed (MB/s) + percentage shown in real time

**Generation 1 (legacy pre-Galaxy games):**
1. Fetches builds using the `generation=1` parameter
2. Downloads each file using `Range` HTTP requests

**Installer fallback (very old pre-Galaxy games with no content-system builds):**
1. Calls `api.gog.com/products/{id}?expand=downloads`
2. Reads `downlink` or `manualUrl` from the downloads object
3. Follows up to 5 redirect hops to the final CDN URL and downloads the Windows installer `.exe` directly

#### Install Flow

- Tapping **Install** opens a confirmation dialog showing the game's download size and your available storage. Nothing downloads until you confirm
- During the download, the Install button turns red and becomes **Cancel**. Tapping it stops the download thread and deletes all partial files from the install directory
- After install, BannerHub Lite scans the install directory for qualifying executables. If exactly one is found it is auto-selected. If two or more are found, a **picker dialog** lets you choose the correct one
- On completion, **✓ Installed** appears on the card and the button changes to **Add Game** (green)
- Tapping **Add Game** opens GameHub's game import dialog with the exe path pre-filled

#### Post-Install

- **Persistent install state** — already-installed games show the checkmark and Add Game button on every open
- **Set .exe** — long-press any installed game → detail dialog shows the current launch executable filename and a **Set .exe…** button to re-scan and re-pick
- **Uninstall** — detail dialog → Uninstall; deletes the install folder, clears prefs, and resets the card to Install immediately
- **Copy to Downloads** — detail dialog → Copy to Downloads; copies the game folder to `Download/GOG Games/<title>/` using MediaStore (no storage permission required)

---

### Amazon Games Tab

Accessible via the left side menu → **Amazon Games**.

- **PKCE OAuth2 login** — WebView opens Amazon's authorization page; authorization code exchanged for access + refresh tokens via PKCE flow
- **Library sync** — fetches your entitled games via `GetEntitlements` API; cover art downloaded and cached
- **manifest.proto download** — downloads the Amazon-format manifest (protobuf, LZMA/XZ compressed) to get the full chunk list
- **6-parallel chunk download** — concurrent download with SHA-256 verification per chunk; live speed (MB/s) + percentage display
- **Game launch** — reads `fuel.json` for launch arguments; sets FuelPump env vars; deploys `FuelSDK_x64.dll` and `AmazonGamesSDK` DLLs to the game directory before launch
- **Installed ✓ indicator**, **Uninstall**

---

### Epic Games Store Tab

Accessible via the left side menu → **Epic Games**.

- **OAuth2 login** — WebView opens Epic's login page; `authorizationCode` extracted from the redirect JSON body
- **Catalog sync** — fetches your entitled games with cover art; cover images cached locally
- **Chunked manifest download** — downloads the Epic JSON manifest; parses `ChunkFilesizeList` (hex values), `windowSize` (uncompressed size), and decimal group subfolder paths
- **CDN selection** — prefers Fastly (`egdownload.fastly-edge.com`) or Akamai (`epicgames-download1.akamaized.net`) public CDNs; no auth token required on chunks
- **6-parallel chunk download** — concurrent download with live speed (MB/s) + percentage display
- **Exe picker + launch** via GameHub's import dialog
- **Installed ✓ indicator**, **Uninstall**

---

### Wine Task Manager

Accessible via the **three-bar icon** in the in-game sidebar (between Settings and the keyboard shortcut icon).

#### Container Info

Always visible at the top:

| Field | Source |
|-------|--------|
| **CPU Cores** | `WINEMU_CPU_AFFINITY` bitmask from the Wine process environment; falls back to active core count |
| **Sys RAM** | `/proc/meminfo` — used MB / total MB |
| **VRam Limit** | `pc_g_setting{gameId}` SharedPreferences → `pc_ls_max_memory`; shows "Unlimited" if unset |
| **Device** | `Build.MODEL` |
| **Android** | `Build.VERSION.RELEASE` + API level |

#### Tabs

| Tab | What it shows |
|-----|--------------|
| **Applications** | Wine infrastructure processes (non-.exe): wineserver, wine64-preloader, etc. — each with PID and **Kill** button |
| **Processes** | Windows .exe processes running under Wine — each with PID and **Kill** button |
| **Launch** | WINEPREFIX file browser — navigate drives and directories |

The Applications and Processes tabs auto-refresh every 3 seconds while the fragment is visible.

#### Launch Tab

When you first open the Launch tab, a background thread reads `WINEPREFIX` from the running Wine process environment and opens `WINEPREFIX/dosdevices/` (which contains drive letter symlinks like `c:`, `d:`, `z:`).

- **Yellow ▶ entries** — directories; tap to navigate into them
- **↑ ..** — tap to go up one level (not shown at the WINEPREFIX root)
- **White entries** — launchable files (`.exe`, `.msi`, `.bat`, `.cmd`); tap to launch

Tapping a launchable file shows a **"Launching: filename"** toast, then runs it via `Runtime.exec(wine <path>)` using the Wine process's own environment — the same environment variables (`WINEPREFIX`, `WINELOADER`, etc.) that the already-running Wine session uses.

---

### Export / Import Game Config

PC game settings include **Export Config** and **Import Config** options accessible from the game's "…" settings menu (My Games → long-press a game → settings).

#### Export Config

Saves all per-game Wine settings (DXVK version, VKD3D version, Box64 version, GPU driver, VRAM limit, CPU affinity, and all other per-game settings) to a JSON file at `/sdcard/BannerHub/configs/<gamename>-<devicename>.json`.

The JSON includes device model, SOC, settings count, component list, and `app_source="bannerhub_lite"` for community backend filtering.

#### Import Config

Lists `.json` files saved in `/sdcard/BannerHub/configs/`. Selecting a file applies all settings from that config to the current game. A SOC mismatch warning is shown if the config was created on a different GPU — you can still apply it.

#### Cross-Compatibility with BannerHub

Configs exported from BannerHub Lite are fully compatible with **[BannerHub](https://github.com/The412Banner/bannerhub)**, and vice versa.

Both apps store per-game settings under the same SharedPreferences keys (`pc_g_setting<gameId>`) and export to the same folder (`/sdcard/BannerHub/configs/`). The export format is identical — the app that created the config has no effect on whether it can be imported. The `app_source` field is only used by the community config site for filtering and is ignored during import.

---

### Component Manager

Accessible via the left side menu → **Components**.

Gives you full control over the emulation components GameHub uses — DXVK, VKD3D, Box64, FEXCore, and GPU Driver entries that appear in per-game settings.

#### Card UI

Each installed component shows as a card with:

- **Color-coded left accent strip** — DXVK (blue), VKD3D (purple), Box64 (green), FEXCore (orange), GPU Driver (yellow)
- **Type badge** derived from component name or saved at download time
- **Source badge** — components downloaded via BannerHub Lite show the repo they came from
- **Install count** in the header
- **Live search bar** — filter cards by name in real time

The header shows a red **Remove All** button when BannerHub-managed components are present.

#### Actions

| Action | How to trigger | What it does |
|--------|---------------|-------------|
| **Add New Component** | Tap "+ Add New" in the bottom bar | Type picker → file picker → injects as a new component slot |
| **Inject / Replace** | Tap a card → "Inject / Replace file..." | Replaces the component's contents |
| **Backup** | Tap a card → "Backup to Downloads" | Copies the component folder to `Downloads/BannerHub/<name>/` |
| **Remove** | Tap a card → "Remove" | Deletes folder, unregisters from GameHub, clears metadata |
| **Remove All** | Tap "Remove All" in header | Removes only BannerHub-managed components |

#### Supported File Formats

| Format | Used for | Extraction |
|--------|---------|-----------|
| `.wcp` (zstd-compressed tar) | DXVK, VKD3D, Box64 | Preserves `system32/` + `syswow64/` structure |
| `.wcp` (XZ-compressed tar) | FEXCore nightlies | Flat extraction to component root |
| `.zip` | GPU Drivers / Turnip / adrenotools | Flat extraction — `meta.json` + `.so` files at root |

---

### Online Component Downloader

Browse and install components from community repos directly within the app. Open it from the **Download** button in the Component Manager.

Three-level navigation: **Repo** → **Type** → **Asset list**

#### Built-in Sources

| Source | What it provides |
|--------|----------------|
| [Arihany WCPHub](https://github.com/Arihany/WinlatorWCPHub) | DXVK, VKD3D, Box64, FEXCore, GPU Drivers |
| [The412Banner Nightlies](https://github.com/The412Banner/Nightlies) | DXVK, VKD3D-Proton, Box64, FEXCore, GPU Drivers |
| Kimchi GPU Drivers (K11MCH1 / AdrenoToolsDrivers) | GPU Drivers only |
| StevenMXZ GPU Drivers | GPU Drivers only |
| MTR GPU Drivers (MaxesTechReview) | GPU Drivers only |
| Whitebelyash GPU Drivers (freedreno Turnip CI) | GPU Drivers only |

---

### BCI Launcher Button

A shortcut button in GameHub's **top-right toolbar** opens [BannersComponentInjector](https://github.com/The412Banner/BannersComponentInjector) (`com.banner.inject`) directly. If BCI is not installed, a toast is shown instead.

---

### Winlator HUD Overlay

An in-game heads-up display overlay controlled from the **Controls sidebar tab**. Two modes are available — enable **Winlator HUD** first, then optionally enable **Extra Detailed** for the expanded view.

#### Normal HUD

Enable **Winlator HUD** in the Controls sidebar. The overlay appears in the top-right corner and persists while a game is running.

Displays per second: GPU%, CPU%, RAM%, battery wattage, battery temperature, FPS, and a rolling FPS graph.

#### Extra Detailed HUD

Enable both **Winlator HUD** and **Extra Detailed** in the Controls sidebar. Replaces the Normal HUD with a richer two-row layout (horizontal) or a full per-metric vertical list (tap to toggle).

**Horizontal layout — Row 1:** TIME | CPU% / CPU°C | C0 | C2 | C4 | C6 | BAT W / BAT°C

**Horizontal layout — Row 2:** API | GPU% / GPU°C | C1 | C3 | C5 | C7 | RAM% | FPS graph (spans both rows)

**Vertical layout:** API, TIME, BAT W, BAT°C, CPU%, CPU°C, GPU%, GPU°C, GPU MHz, per-core C0–C7, RAM%, SWAP used/total, FPS graph

Drag to reposition. Position and orientation persist across sessions. *Extra Detailed* is automatically greyed out when the HUD toggle is off.

#### Opacity Slider

Drag the **HUD Opacity (0–100%)** slider to adjust background transparency live. The value is saved and restored on next session.

---

### Performance Sidebar Toggles

Located in the in-game **Controls sidebar tab**. Both toggles persist their state in `bh_prefs` and re-apply when the sidebar opens.

Root access is checked once when you grant it in **Settings → Advanced**. The toggles read that stored result — no root permission popup appears every time you open the Controls tab.

> **WARNING — USE AT YOUR OWN RISK**
>
> These toggles override your device's thermal management. Forcing the CPU and GPU to run at maximum frequency continuously generates significantly more heat than normal operation. Sustained high temperatures can cause permanent damage to your device's processor, battery, and other components. Device manufacturers do not support or warrant against damage caused by overriding performance governors. By using these toggles you accept full responsibility for any damage, data loss, throttling, unexpected shutdowns, or reduced component lifespan that results. **Do not leave these enabled unattended. Monitor your device temperature. Disable them immediately if your device becomes uncomfortably hot.**

Both toggles require root. Without root, both are greyed out at 50% opacity and have no click listener.

#### Sustained Performance Mode

**Requires root.**

Enables `Window.setSustainedPerformanceMode(true)` (Android 7.0+ thermal-stable performance hint) and sets all CPU cores to the `performance` governor via `su`. On disable, `schedutil` is restored.

#### Max Adreno Clocks

**Requires root. Adreno GPUs only (Qualcomm Snapdragon devices).**

Locks the KGSL DVFS minimum frequency equal to the current maximum frequency — the GPU physically cannot clock below maximum short of a kernel thermal emergency. On disable, the floor is removed and DVFS returns to normal.

---

### RTS Touch Controls

RTS touch controls are **built into GameHub Lite 5.1.4** — no patch is needed. Enable them via the **Controls tab** in the in-game sidebar.

| Gesture | Mouse action |
|---------|-------------|
| Single tap | Move cursor + left-click |
| Drag | Hold LMB while dragging (box selection) |
| Long press (300 ms) | Right-click |
| Double-tap (250 ms / 50 px) | Double left-click |
| Two-finger pan | Camera pan |
| Pinch to zoom | Mouse wheel scroll |

---

### VRAM Limit Unlock

PC game settings → **VRAM Limit** now includes **6 GB, 8 GB, 12 GB, and 16 GB** options alongside the original 512 MB–4 GB range.

---

### Per-Game CPU Core Affinity

PC game settings → **CPU Core Limit** opens a checkbox dialog to pin the game process to specific CPU cores.

| Core(s) | Label |
|---------|-------|
| Core 0–3 | Efficiency |
| Core 4–6 | Performance |
| Core 7 | Prime |

---

### GPU System Driver Default

New games automatically default the GPU Driver setting to **System Driver** instead of leaving it unset. This prevents launch crashes on first-time setup.

---

### Offline Steam Launch

When Steam's auto-login request fails at cold start and no network is available, BannerHub Lite skips the Steam login screen and proceeds with the locally cached Steam configuration.

---

### Launch Fix (Hardware Whitelist Bypass)

GameHub Lite performs an HTTP device-check at launch time. On many devices this returns HTTP 404 (device not in the list), which blocks game launch entirely. BannerHub Lite treats the 404 as a pass.

---

### Settings: Advanced Tab

| Setting | What it does |
|---------|-------------|
| **Grant Root Access** | Shows a warning dialog explaining what root is used for. On confirmation, runs `su -c id` on a background thread — your root manager will show its own prompt. The result is stored in `bh_prefs`. Tapping again while root is already granted shows a **Revoke** option |

---

### Controller Navigation

All three game store activities (GOG, Epic, Amazon) support full D-pad / gamepad controller navigation.

- **Game cards (list view)** — navigate up/down with D-pad; focused card shows a gold border and slightly lighter background; press A to expand/collapse
- **Game tiles (grid view)** — navigate in all four directions; focused tile shows a gold border overlay; press A to expand/select
- **Header buttons** (back, view toggle, refresh) — focusable with a gold border on focus; press A to activate

Focus highlight uses gold (#FFD700) consistently across all stores and view modes.

---

### UI Tweaks

- The **"Dashboard"** sidebar tab is renamed to **"My Games"** for clarity.
- **Japanese translations** — 3,534 strings from Crowdin.

---

## How It Works

1. The original GameHub Lite 5.1.4 APK (vanilla, no ReVanced) is stored as a permanent release asset under the [`base-apk`](../../releases/tag/base-apk) tag.
2. CI downloads the base APK, decompiles it with apktool, overlays the `patches/` directory, and builds all 9 package variants.
3. All new BannerHub Lite code is written in Java, compiled via `javac` + `d8` to `classes11.dex`. GameHub Lite 5.1.4 uses `classes.dex` through `classes10.dex` — `classes11` has no conflict.
4. The rebuilt APK is zipaligned and signed with AOSP testkey (v1 + v2 + v3).
5. The CI matrix uploads all 9 variant APKs to the GitHub Release.

No external dex is injected into the base classes — the extension code is self-contained in `classes11.dex`.

---

## FAQ

**Q: Does BannerHub Lite require root?**

Most features work without root. The only features that require root are the two Performance sidebar toggles (Sustained Performance Mode and Max Adreno Clocks) — both are greyed out and non-interactive on non-rooted devices. Everything else — GOG/Amazon/Epic tabs, Component Manager, downloader, VRAM unlock, CPU core limit, HUD overlay, offline modes, launch fix, and settings — works on any non-rooted device.

**Q: Will this replace my existing GameHub Lite?**

Yes — because BannerHub Lite is signed with a different certificate (AOSP testkey), Android treats it as a different signer and will not allow an in-place update. You must uninstall your existing GameHub Lite first. Your game library and containers stored in app data will be lost unless you back them up beforehand.

**Q: Why does Max Adreno Clocks require root?**

BannerHub Lite writes directly to `/sys/class/kgsl/kgsl-3d0/devfreq/min_freq` — a privileged sysfs node that requires root to write to.

**Q: Max Adreno Clocks is greyed out on my device — is it broken?**

If it is greyed out, root has not been granted yet. Go to **Settings → Advanced → Grant Root Access** and follow the prompt. If root is granted and it is still greyed out, your device may not have an Adreno GPU (this toggle is Adreno/Qualcomm-only).

**Q: My GOG game has no builds available — what does that mean?**

Your game may be a very old pre-Galaxy title that pre-dates GOG's content system. BannerHub Lite will automatically fall back to the installer download path, which fetches the Windows `.exe` installer directly from GOG's download API.

**Q: Where are GOG / Amazon / Epic games installed?**

Inside the app's private storage: `Android/data/<package>/files/gog_games/<title>/`, `amazon_games/<title>/`, or `epic_games/<title>/` respectively. These files are only accessible via a file manager with root, or if you grant SAF access via BCI. GOG games have a **Copy to Downloads** button in the detail dialog to copy files to `Downloads/GOG Games/<title>/` for access from any file manager.

**Q: Are game configs compatible with BannerHub?**

Yes — configs exported from BannerHub Lite can be imported in BannerHub and vice versa. Both apps use the same SharedPreferences keys and the same export folder (`/sdcard/BannerHub/configs/`). See [Export / Import Game Config](#export--import-game-config) for details.

---

## Credits

- **GameHub Lite** — [Python](https://github.com) (original GameHub Lite creator) and [Producdevity](https://github.com/Producdevity/gamehub-lite) (current maintainer)
- **GOG / Amazon / Epic integration** — [The GameNative Team](https://github.com/utkarshdalal/GameNative). The store pipelines, authentication flows, download architecture, and library sync in BannerHub Lite are ported from BannerHub, which is based on their research and implementation.
- **BannerHub** — all ported features originate from [BannerHub](https://github.com/The412Banner/bannerhub)
- **Winlator HUD** — [StevenMXZ](https://github.com/StevenMXZ). The Extra Detailed HUD is a continuation and extension of the original Winlator HUD.
- **Component sources** — [Arihany WCPHub](https://github.com/Arihany/WinlatorWCPHub), [The412Banner Nightlies](https://github.com/The412Banner/Nightlies), Kimchi, StevenMXZ, MaxesTechReview, Whitebelyash

---

## Build Info

- **Base APK:** GameHub Lite 5.1.4 (vanilla, no ReVanced) — stored as a permanent release under the [`base-apk`](../../releases/tag/base-apk) tag
- **Extension DEX:** All BannerHub Lite Java code compiles to `classes11.dex` — no conflict with GameHub Lite's `classes.dex` through `classes10.dex`
- **Signing:** AOSP testkey (v1 + v2 + v3) via apksigner — same key across all variants and all releases
- **Variants:** 9 package variants built per release — see [Installation](#installation) for the full list

---

<sub>☕ [Support on Ko-fi](https://ko-fi.com/the412banner)</sub>
