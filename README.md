# BannerHub Lite

A modified build of **[GameHub Lite](https://github.com/Producdevity/gamehub-lite)** by Producdevity, with BannerHub features ported in.

---

## What is GameHub Lite?

[GameHub Lite](https://github.com/Producdevity/gamehub-lite) is an Android app that acts as a front-end launcher for **Windows PC game emulation** on Android using Wine/Proton and associated compatibility layers (DXVK, VKD3D-Proton, Box64, FEXCore, GPU drivers). It manages emulation components, Steam game libraries, and Windows environment containers.

This project patches **GameHub Lite 5.1.4** (vanilla, not ReVanced) with additional quality-of-life features originally developed for BannerHub (a separate ReVanced-based mod of GameHub 5.3.5).

---

## What BannerHub Lite adds

| Feature | Description |
|---|---|
| **My Games** tab rename | The "Dashboard" sidebar tab is renamed to "My Games" |
| **BCI launcher button** | Button in the top-right toolbar that opens [BannersComponentInjector](https://github.com/The412Banner/BannersComponentInjector) if installed, otherwise shows a toast |
| **Component Manager** | Full sidebar "Components" entry — inject, add, remove, backup, and download emulation components |
| **Online Component Downloader** | Browse 7 community repos by category and install components directly from within the app |
| **Offline Steam skip** | If not Steam-logged-in and offline, skips the login dialog and attempts to launch the game offline anyway |
| **Sustained Performance toggle** | Sidebar switch — enables `setSustainedPerformanceMode` + sets CPU scaling governor to `performance` via root (Root+) |
| **Max Adreno Clocks toggle** | Sidebar switch — pins GPU minimum frequency to maximum via `/sys/class/kgsl/kgsl-3d0/devfreq/` using root (Root) |

> **RTS touch controls** are already built into the GameHub Lite 5.1.4 base APK — no patch needed.

---

## Component Manager

The Component Manager is accessible from the left sidebar under "Components". It gives you direct control over the emulation components installed in GameHub without needing an external app.

### Main screen
- **+ Add New Component** — opens a type selection menu to install a new component from a file or online repo
- **Component list** — shows all installed component folders; tap any to see options
- **✕ Remove All Components** — bulk remove all BannerHub-injected components (with confirmation)

### Adding a new component
1. Tap **+ Add New Component**
2. Select the component type:
   - **↓ Download from Online Repos** — browse online repos (see below)
   - **DXVK** — DirectX → Vulkan translation layer
   - **VKD3D-Proton** — DirectX 12 → Vulkan translation layer
   - **Box64** — x86-64 CPU emulator
   - **FEXCore** — alternative x86-64 CPU emulator
   - **GPU Driver / Turnip** — custom Vulkan GPU driver (Adreno / Turnip / Mesa)
3. Pick a `.wcp`, `.zip`, or `.xz` file from your device
4. The component is extracted and registered with GameHub automatically — it will appear in game settings component pickers immediately

### Per-component options
Tap any installed component to get:
- **Inject/Replace file...** — copy a file into the component's folder (replaces existing)
- **Backup** — copies the component folder to `Downloads/BannerHub/<name>/`
- **Remove** — deletes the component folder and unregisters it from GameHub (with confirmation)
- **← Back** — return to the component list

### Supported file formats
| Format | Used for |
|---|---|
| `.wcp` | Standard WCP archive — zstd-compressed tar containing `profile.json` + DLL directories |
| `.wcp.xz` / XZ-compressed WCP | FEXCore nightlies and some other repos |
| `.zip` | GPU drivers / Turnip — flat zip containing `meta.json` + `.so` libraries |

---

## Online Component Downloader

Browse and install components directly from community repos without leaving the app.

### Repos
| Repo | Source |
|---|---|
| Arihany WCPHub | [WinlatorWCPHub/pack.json](https://github.com/Arihany/WinlatorWCPHub) |
| Kimchi GPU Drivers | [Nightlies/kimchi_drivers.json](https://github.com/The412Banner/Nightlies) |
| StevenMXZ GPU Drivers | [Nightlies/stevenmxz_drivers.json](https://github.com/The412Banner/Nightlies) |
| MTR GPU Drivers | [Nightlies/mtr_drivers.json](https://github.com/The412Banner/Nightlies) |
| Whitebelyash GPU Drivers | [Nightlies/white_drivers.json](https://github.com/The412Banner/Nightlies) |
| The412Banner Nightlies | [Nightlies/nightlies_components.json](https://github.com/The412Banner/Nightlies) |

### Category filter
After selecting a repo, filter by: **DXVK** / **VKD3D** / **Box64** / **FEXCore** / **GPU Driver** / **All**

---

## Performance Toggles

Found in the game/emulation sidebar under the performance section. Both require root (`su`). If root is not available, the toggles are shown at 50% opacity and cannot be tapped.

**Sustained Performance** (Root+)
- Calls Android's `Window.setSustainedPerformanceMode(true)` — reduces thermal throttling by capping the device to a sustained power envelope
- Sets CPU scaling governor to `performance` (on) or `schedutil` (off) via `su -c`
- Best for long gaming sessions where consistent frame pacing matters more than peak performance

**Max Adreno Clocks** (Root)
- Pins GPU minimum frequency to maximum via `su -c "echo <max> > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq"`
- Forces the Adreno GPU to run at its highest clock speed at all times
- Useful for benchmarking or GPU-bound games where the driver is underclocking

---

## Installation

### Choosing your APK

8 APK variants are built — pick the one that matches the package name of your GameHub Lite installation:

| APK | Package name | Use when |
|---|---|---|
| Normal | `gamehub.lite` | Standard GameHub Lite |
| PuBG | `com.tencent.ig` | GameHub Lite PUBG variant |
| AnTuTu | `com.antutu.ABenchMark` | AnTuTu variant |
| alt-AnTuTu | `com.antutu.benchmark.full` | AnTuTu Full variant |
| PuBG-CrossFire | `com.tencent.tmgp.cf` | CrossFire variant |
| Ludashi | `com.ludashi.aibench` | Ludashi / Aibench variant |
| Genshin | `com.mihoyo.genshinimpact` | Genshin variant |
| Original | `com.xiaoji.egggame` | Original/EggGame variant |

### Steps
1. **Uninstall** your existing GameHub Lite first — this APK is signed with a different key (AOSP testkey) and cannot be installed alongside the original
2. Download the correct variant APK from [Releases](../../releases)
3. Install and launch

> Your game library, containers, and settings are stored in app data — they will be preserved if you back them up before uninstalling, but a fresh install will start clean.

---

## How components are registered

When you install a component via BannerHub Lite (inject from file or download from repo), it:

1. Extracts the archive into `files/usr/home/components/<name>/`
2. Reads `profile.json` (WCP) or `meta.json` (ZIP) to get the component name, version, and description
3. Registers the component with GameHub's internal `EmuComponents` system via reflection — this is the same registry GameHub uses for components downloaded through its own UI
4. Stamps a `.bh_injected` marker file in the component folder so BannerHub knows which components it manages
5. The component immediately appears in game settings component pickers (DXVK selector, Box64 selector, GPU Driver selector, etc.) without needing to restart the app

---

## Credits

- **[Producdevity](https://github.com/Producdevity/gamehub-lite)** — GameHub Lite (base app, all core emulation functionality)
- **The412Banner** — BannerHub Lite patches (this repo)
- Community component repos: StevenMXZ, Arihany, Xnick417x, K11MCH1, whitebelyash, MaxesTechReview (MTR)

---

## Build info

- Base APK: `GameHub-Lite-v5.1.4.apk` — stored in the [`base-apk`](../../releases/tag/base-apk) release
- CI: GitHub Actions — `build.yml` builds all 8 variants on `v*` stable tags; `build-quick.yml` builds Normal APK only on `v*-pre*` tags
- Signed with AOSP testkey (v1 + v2 + v3 signatures)
- Extension code compiled to `classes11.dex` (5.1.4 uses `classes.dex` through `classes10.dex` — no conflict)
