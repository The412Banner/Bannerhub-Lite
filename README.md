# BannerHub Lite

A modified build of **[GameHub Lite 5.1.4](https://github.com/Producdevity/gamehub-lite)** with BannerHub features ported in — Component Manager, in-app component downloader, GOG Games tab, performance toggles, CPU core affinity, VRAM unlock, offline Steam skip, root access management, and more. Built with apktool + compiled Java extension (no source code from GameHub).

---

## Table of Contents

- [BannerHub Lite vs BannerHub](#bannerhub-lite-vs-bannerhub)
- [Installation](#installation)
- [Features](#features)
  - [GOG Games Tab](#gog-games-tab)
  - [Component Manager](#component-manager)
  - [Online Component Downloader](#online-component-downloader)
  - [BCI Launcher Button](#bci-launcher-button)
  - [Performance Sidebar Toggles](#performance-sidebar-toggles)
  - [RTS Touch Controls](#rts-touch-controls)
  - [VRAM Limit Unlock](#vram-limit-unlock)
  - [Per-Game CPU Core Affinity](#per-game-cpu-core-affinity)
  - [GPU System Driver Default](#gpu-system-driver-default)
  - [Offline Steam Launch](#offline-steam-launch)
  - [Launch Fix (Hardware Whitelist Bypass)](#launch-fix-hardware-whitelist-bypass)
  - [Settings: Advanced Tab](#settings-advanced-tab)
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
| **Sustained Perf toggle behavior** | `setSustainedPerformanceMode` + CPU governor (root) | CPU governor only (root) |
| **GOG Games tab** | Yes | Yes |
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

8 APK variants are built — pick the one matching the package name of your existing GameHub Lite installation:

| APK | Package | App label |
|-----|---------|-----------|
| Normal | `gamehub.lite` | BannerHub Lite |
| PuBG | `com.tencent.ig` | BannerHub Lite PuBG |
| AnTuTu | `com.antutu.ABenchMark` | BannerHub Lite AnTuTu |
| alt-AnTuTu | `com.antutu.benchmark.full` | BannerHub Lite AnTuTu |
| CrossFire | `com.tencent.tmgp.cf` | BannerHub Lite CrossFire |
| Ludashi | `com.ludashi.aibench` | BannerHub Lite Ludashi |
| Genshin | `com.mihoyo.genshinimpact` | BannerHub Lite Genshin |
| Original | `com.xiaoji.egggame` | BannerHub Lite Original |

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
- **Collapsible game cards** — cards start collapsed (cover art + Gen badge + title + ✓ + ▼ arrow). First tap expands to reveal developer, genre, progress bar, and Install / Add Game button. Tap an expanded card to open the detail dialog (Uninstall / Copy to Downloads). Tap the ▲ arrow to collapse without opening the dialog. Only one card is expanded at a time
- **Installed indicator** — a green ✓ appears next to the game title on collapsed cards so install status is visible at a glance without expanding

#### Download Pipeline

BannerHub Lite supports three download methods depending on the age of the game:

**Generation 2 (Galaxy-era games):**
1. Fetches the build manifest from GOG's content-system API
2. Downloads and parses the depot manifest to get the full file list (paths normalized for Android)
3. Downloads each file chunk-by-chunk; per-file filename + percentage shown in real time next to the game title

**Generation 1 (legacy pre-Galaxy games):**
1. Fetches builds using the `generation=1` parameter
2. Downloads each file using `Range` HTTP requests

**Installer fallback (very old pre-Galaxy games with no content-system builds):**

Some titles pre-date the content-system entirely. For these, BannerHub Lite falls back to:
1. Calls `api.gog.com/products/{id}?expand=downloads`
2. Reads `downlink` or `manualUrl` from the downloads object
3. Follows up to 5 redirect hops to the final CDN URL and downloads the Windows installer `.exe` directly

#### Install Flow

- Tapping **Install** starts the download immediately with a progress bar + status text and a live percentage counter next to the game title
- On completion, **✓ Installed** appears on the card and the button changes to **Add Game** (green)
- Tapping **Add Game** saves the exe path, closes the GOG screen, and automatically opens GameHub's game import dialog with the path pre-filled — no manual navigation needed

#### Post-Install

- **Persistent install state** — already-installed games show the checkmark and Add Game button on every open
- **Uninstall** — tap the game card → detail dialog → Uninstall; deletes the install folder, clears prefs, and resets the card to Install immediately
- **Copy to Downloads** — tap the game card → detail dialog → Copy to Downloads; copies the game folder to `Download/GOG Games/<title>/` using MediaStore (no storage permission required on Android 10+)

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
| **Add New Component** | Tap "+ Add New" in the bottom bar | Type picker → file picker → injects as a new component slot; appears in GameHub's pickers immediately |
| **Inject / Replace** | Tap a card → "Inject / Replace file..." | Replaces the component's contents; folder is cleared first |
| **Backup** | Tap a card → "Backup to Downloads" | Copies the component folder to `Downloads/BannerHub/<name>/` |
| **Remove** | Tap a card → "Remove" | Deletes folder, unregisters from GameHub, clears download metadata (confirmation required) |
| **Remove All** | Tap "Remove All" in header | Removes only BannerHub-managed components (marked with a `.bh_injected` file). GameHub-installed components are never touched |

#### How Components are Registered

When BannerHub Lite installs a component (inject from file or download from repo):

1. Extracts the archive into `files/usr/home/components/<name>/`
2. Reads `profile.json` (WCP) or `meta.json` (ZIP) to get name, version, and description
3. Registers the component with GameHub's internal `EmuComponents` system via reflection — the same registry GameHub uses for its own downloads
4. Stamps a `.bh_injected` marker file in the folder so Remove All knows what it manages
5. The component appears in game settings pickers immediately — no app restart needed

#### Supported File Formats

| Format | Used for | Extraction |
|--------|---------|-----------|
| `.wcp` (zstd-compressed tar) | DXVK, VKD3D, Box64 | Preserves `system32/` + `syswow64/` structure |
| `.wcp` (XZ-compressed tar) | FEXCore nightlies | Flat extraction to component root |
| `.zip` | GPU Drivers / Turnip / adrenotools | Flat extraction — `meta.json` + `.so` files at root |

---

### Online Component Downloader

Browse and install components from community repos directly within the app. Open it from the **Download** button in the Component Manager.

#### Navigation

Three-level navigation: **Repo** → **Type** → **Asset list**

- Assets already installed via BannerHub Lite show a checkmark; it clears when the component is removed
- Tapping an asset downloads it to cache and installs it automatically with a progress screen

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

BCI is a companion app providing SAF-based component management, virtual container access, and Steam shadercache browsing without root.

---

### Performance Sidebar Toggles

Located in the in-game **Performance sidebar tab**. Both toggles persist their state in `bh_prefs` and re-apply when the sidebar opens.

Root access is checked once when you grant it in **Settings → Advanced**. The toggles read that stored result — no root permission popup appears every time you open the Performance tab.

> **WARNING — USE AT YOUR OWN RISK**
>
> These toggles override your device's thermal management. Forcing the CPU and GPU to run at maximum frequency continuously generates significantly more heat than normal operation. Sustained high temperatures can cause permanent damage to your device's processor, battery, and other components. Device manufacturers do not support or warrant against damage caused by overriding performance governors. By using these toggles you accept full responsibility for any damage, data loss, throttling, unexpected shutdowns, or reduced component lifespan that results. **Do not leave these enabled unattended. Monitor your device temperature. Disable them immediately if your device becomes uncomfortably hot.**

Both toggles require root. Without root, both are greyed out at 50% opacity and have no click listener — tapping them does nothing.

#### Sustained Performance Mode

**Requires root.**

| | Without root | With root |
|---|---|---|
| **Behavior** | Greyed out, non-interactive | `setSustainedPerformanceMode(true)` + CPU `performance` governor via `su` |
| **Disable** | N/A | `setSustainedPerformanceMode(false)` + CPU `schedutil` governor via `su` |

BannerHub Lite's Sustained Perf toggle does two things when enabled (both require root to activate):

**1. `Window.setSustainedPerformanceMode(true)`**

An Android API (available since Android 7.0) that hints the system to maintain a thermally-stable performance envelope rather than allowing burst clocks followed by thermal throttle-back. It is designed to keep frame times consistent over long sessions by trading peak frequency for stability. Support and effectiveness vary by device and OEM kernel.

**2. CPU governor: `performance`**

The CPU frequency governor controls how the kernel picks a clock speed for each core. The `performance` governor always selects the maximum available frequency regardless of load, eliminating all downclocking while the toggle is active. On disable, `schedutil` is restored — a load-tracking governor that scales frequency dynamically based on CPU utilisation.

Shell commands issued (with `su`):
```sh
# Enable
for f in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do echo performance > "$f"; done

# Disable
for f in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do echo schedutil > "$f"; done
```

#### Max Adreno Clocks

**Requires root. Adreno GPUs only (Qualcomm Snapdragon devices).**

| | Without root | With root |
|---|---|---|
| **Behavior** | Greyed out, non-interactive | Locks GPU clock floor = GPU clock ceiling |
| **Disable** | N/A | Removes the floor — DVFS returns to normal |

Qualcomm Adreno GPUs are managed by the **KGSL** (Kernel Graphics Support Layer) driver, which exposes a devfreq interface at `/sys/class/kgsl/kgsl-3d0/devfreq/`. BannerHub Lite sets the DVFS **minimum frequency** equal to the current **maximum frequency**, leaving the GPU no lower clock level to fall back to:

```sh
# Enable — read max_freq and write it to min_freq
cat /sys/class/kgsl/kgsl-3d0/devfreq/max_freq > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq

# Disable — remove the floor
echo 0 > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq
```

Writing to `/sys/class/kgsl/` is a privileged sysfs operation — it requires root. This sets a hard floor at the kernel driver level; the GPU physically cannot clock below maximum unless the kernel thermal governor intervenes at an emergency level. The tradeoff is significantly increased heat and battery drain, as the GPU never idles.

**Use both toggles together** for maximum sustained CPU + GPU performance. Root is required for both.

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

Tap the **gear icon** in the Controls tab to configure two-finger and pinch behavior.

---

### VRAM Limit Unlock

PC game settings → **VRAM Limit** now includes **6 GB, 8 GB, 12 GB, and 16 GB** options alongside the original 512 MB–4 GB range.

Useful for games or translation layers (DXVK, VKD3D) that read the reported VRAM value at startup and limit texture quality or refuse to run below a threshold.

---

### Per-Game CPU Core Affinity

PC game settings → **CPU Core Limit** opens a checkbox dialog to pin the game process to specific CPU cores.

#### Core Labels

| Core(s) | Label |
|---------|-------|
| Core 0–3 | Efficiency |
| Core 4–6 | Performance |
| Core 7 | Prime |

Labels reflect the typical cluster naming on Snapdragon SoCs. The exact frequency of each core depends on your device.

#### Fixed Presets

| Preset | Bitmask |
|--------|---------|
| No Limit | 0x00 — all cores, no pinning |
| Cores 4–7 (Performance + Prime) | 0xF0 |
| Cores 0–3 (Efficiency) | 0x0F |
| Single core (0–7) | 0x01–0x80 |

For any custom combination, the label shows e.g. **"Core 0 + Core 4 + Core 7"**. The selected bitmask is passed directly to Wine's CPU affinity setting.

---

### GPU System Driver Default

New games in BannerHub Lite automatically default the GPU Driver setting to **System Driver** instead of leaving it unset. This prevents launch crashes on first-time setup where a custom driver is selected but not installed, which is one of the most common causes of black-screen failures on new devices.

---

### Offline Steam Launch

When Steam's auto-login request fails at cold start and no network is available, BannerHub Lite detects the condition and skips the Steam login screen entirely. The launch pipeline proceeds using the locally cached Steam configuration, allowing you to play installed Steam games without an internet connection.

---

### Launch Fix (Hardware Whitelist Bypass)

GameHub Lite performs an HTTP device-check API call at launch time to verify the device is on a supported hardware list. On many devices this returns HTTP 404 (device not in the list), which blocks game launch entirely.

BannerHub Lite bypasses this check — the 404 response is treated as a pass, not a failure. Games launch correctly regardless of whether the device is in GameHub's whitelist.

---

### Settings: Advanced Tab

BannerHub Lite adds one item to GameHub Lite's existing Advanced settings:

| Setting | What it does |
|---------|-------------|
| **Grant Root Access** | Shows a warning dialog explaining exactly what root is used for (Sustained Performance Mode and Max Adreno Clocks). On confirmation, runs `su -c id` on a background thread — your root manager (Magisk, KernelSU, etc.) will show its own prompt at this point. The result is stored in `bh_prefs`. The Performance sidebar reads this pref on open — no unsolicited root popup every time you navigate to that tab. Tapping the button again while root is already granted shows a **Revoke** option instead |

---

### UI Tweaks

- The **"Dashboard"** sidebar tab is renamed to **"My Games"** for clarity.

---

## How It Works

1. The original GameHub Lite 5.1.4 APK (vanilla, no ReVanced) is stored as a permanent release asset under the [`base-apk`](../../releases/tag/base-apk) tag.
2. CI downloads the base APK, decompiles it with apktool, overlays the `patches/` directory, and builds all 8 package variants.
3. All new BannerHub Lite code is written in Java, compiled via `javac` + `d8` to `classes11.dex`. GameHub Lite 5.1.4 uses `classes.dex` through `classes10.dex` — `classes11` has no conflict.
4. The rebuilt APK is zipaligned and signed with AOSP testkey (v1 + v2 + v3).
5. The CI matrix uploads all 8 variant APKs to the GitHub Release.

No external dex is injected into the base classes — the extension code is self-contained in `classes11.dex`.

---

## FAQ

**Q: Does BannerHub Lite require root?**

Most features work without root. The only features that require root are the two Performance sidebar toggles (Sustained Performance Mode and Max Adreno Clocks) — both are greyed out and non-interactive on non-rooted devices. Everything else — GOG tab, Component Manager, downloader, VRAM unlock, CPU core limit, offline modes, launch fix, and settings — works on any non-rooted device.

**Q: Will this replace my existing GameHub Lite?**

Yes — because BannerHub Lite is signed with a different certificate (AOSP testkey), Android treats it as a different signer and will not allow an in-place update. You must uninstall your existing GameHub Lite first. Your game library and containers stored in app data will be lost unless you back them up beforehand.

**Q: Why does Max Adreno Clocks require root?**

BannerHub Lite writes directly to `/sys/class/kgsl/kgsl-3d0/devfreq/min_freq` — a privileged sysfs node. Some emulators use the KGSL ioctl interface (`/dev/kgsl-3d0`) instead, which is accessible to unprivileged apps, but that sends a hint the GPU driver can still override under thermal pressure. The sysfs write is a hard floor the GPU cannot ignore short of a kernel thermal emergency — at the cost of requiring root.

**Q: Max Adreno Clocks is greyed out on my device — is it broken?**

If it is greyed out, root has not been granted yet. Go to **Settings → Advanced → Grant Root Access** and follow the prompt. If root is granted and it is still greyed out, your device may not have an Adreno GPU (this toggle is Adreno/Qualcomm-only) or the sysfs path does not exist on your kernel.

**Q: My GOG game has no builds available — what does that mean?**

Your game may be a very old pre-Galaxy title that pre-dates GOG's content system. BannerHub Lite will automatically fall back to the installer download path, which fetches the Windows `.exe` installer directly from GOG's download API.

**Q: Where are GOG games installed?**

Inside the app's private storage: `Android/data/<package>/files/gog_games/<title>/`. These files are only accessible via a file manager with root, or if you grant SAF access via BCI.

---

## Credits

- **Python** — original creator of GameHub Lite
- **[Producdevity](https://github.com/Producdevity/gamehub-lite)** — current maintainer of GameHub Lite (base app, all core emulation functionality)
- **[The412Banner/BannerHub](https://github.com/The412Banner/bannerhub)** — original source of all BannerHub features ported into this project
- **The412Banner** — BannerHub Lite patches (this repo)
- **[The GameNative Team](https://github.com/utkarshdalal/GameNative)** — GOG API pipeline, authentication flow, and download architecture research

**Community component repos:**
- [Arihany](https://github.com/Arihany/WinlatorWCPHub) — WCPHub (DXVK, VKD3D, Box64, FEXCore)
- [K11MCH1 / AdrenoToolsDrivers](https://github.com/K11MCH1/AdrenoToolsDrivers) — Kimchi GPU drivers
- [whitebelyash](https://github.com/whitebelyash/freedreno_Turnip-CI) — freedreno Turnip CI drivers
- [StevenMXZ](https://github.com/StevenMXZ) — GPU drivers
- [MaxesTechReview (MTR)](https://github.com/MaxesTechReview) — GPU drivers
- [The412Banner/Nightlies](https://github.com/The412Banner/Nightlies) — nightly builds (DXVK, VKD3D, Box64, FEXCore, GPU drivers)

---

## Build Info

- **Base APK:** `GameHub-Lite-v5.1.4.apk` — stored in the [`base-apk`](../../releases/tag/base-apk) release (vanilla, non-ReVanced)
- **CI:** `build.yml` — 8-variant matrix build on `v*` stable tags; `build-quick.yml` — Normal APK only on `v*-pre*` tags
- **Extension:** Java source in `extension/` compiled to `classes11.dex` via `javac` + `d8`
- **Signing:** AOSP testkey (`testkey.pk8` / `testkey.x509.pem`), v1 + v2 + v3 signatures via apksigner

---

<sub>☕ [Support on Ko-fi](https://ko-fi.com/the412banner)</sub>
