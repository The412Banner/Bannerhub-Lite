# BannerHub Lite

BannerHub features ported into **GameHub Lite 5.1.4** (vanilla, non-ReVanced base APK).

## Features

| Feature | Description |
|---|---|
| My Games tab | Renames the "Dashboard" sidebar tab to "My Games" |
| BCI launcher button | Top-right toolbar button — opens BannersComponentInjector if installed |
| Component Manager | Full-featured sidebar "Components" entry with inject/add/remove/backup/download |
| Component Downloader | 8 online repos, category filter, GitHub Releases API + pack.json support |
| Offline Steam skip | If not Steam-logged-in and offline, skips login screen and launches offline |
| Sustained Performance | Sidebar toggle — `setSustainedPerformanceMode` + CPU governor (Root+) |
| Max Adreno Clocks | Sidebar toggle — locks GPU min_freq = max_freq via `su -c` (Root) |

> **RTS touch controls** are NOT patched — they already exist in the 5.1.4 base APK.

## Component Manager Details

- Lists all component folders from `files/usr/home/components/`
- **Inject file** — pick WCP/ZIP/XZ from device (with duplicate prevention)
- **Add New Component** — creates an empty component folder
- **Remove Component** / **Remove All** — delete with confirmation dialog
- **Backup** — copies component to `Downloads/BannerHub/<name>/`
- **Download from Online Repos** — in-app downloader

## Component Downloader Repos

| Repo | Format |
|---|---|
| StevenMXZ | GitHub Releases API |
| Arihany WCPHub | pack.json |
| Xnick417x | GitHub Releases API |
| AdrenoTools Drivers (K11MCH1) | GitHub Releases API |
| Freedreno Turnip CI (whitebelyash) | GitHub Releases API |
| MaxesTechReview (MTR) | GitHub Releases API |
| HUB Emulators (T3st31) | GitHub Releases API |
| Nightlies by The412Banner | GitHub Releases API |

## Performance Toggles

Both toggles are greyed out (non-clickable) if root (`su`) is not available.

- **Sustained Performance** — calls `Window.setSustainedPerformanceMode()` + sets CPU scaling governor to `performance` (enable) or `schedutil` (disable) via `su -c`
- **Max Adreno Clocks** — pins GPU min_freq = max_freq via `/sys/class/kgsl/kgsl-3d0/devfreq/` using `su -c`

## APK Variants (8 total)

| APK | Package |
|---|---|
| Normal | `gamehub.lite` |
| PuBG | `com.tencent.ig` |
| AnTuTu | `com.antutu.ABenchMark` |
| alt-AnTuTu | `com.antutu.benchmark.full` |
| PuBG-CrossFire | `com.tencent.tmgp.cf` |
| Ludashi | `com.ludashi.aibench` |
| Genshin | `com.mihoyo.genshinimpact` |
| Original | `com.xiaoji.egggame` |

## Build

CI builds on every `v*` tag push (8 APKs via matrix). Pre-release tags (`v*-pre*`) build Normal APK only via `build-quick.yml`.

Signed with AOSP testkey (v1 + v2 + v3). Must uninstall the original GameHub Lite before installing (signature mismatch).

## Base APK

`GameHub-Lite-v5.1.4.apk` stored in the [`base-apk`](../../releases/tag/base-apk) release.
