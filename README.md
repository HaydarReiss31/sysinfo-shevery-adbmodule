# Sys Info — ADB Module

![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)
![Version](https://img.shields.io/badge/version-2.0-4fd1c5.svg)

A lightweight system info dashboard for Shizuku-based ADB module managers — works with [Shevery](https://github.com/HmnDev-Tech/shevery) and [Nightzuku](https://github.com/kerneldroid/Nightzuku/tree/main). Runs entirely through the Shizuku shell bridge — no root required.

## Screenshots

<table>
<tr>
<td><img src="screenshots/panel.png" width="120"/></td>
<td><img src="screenshots/hardware.png" width="120"/></td>
<td><img src="screenshots/graphics.png" width="120"/></td>
</tr>
</table>

## Features

- **Panel** — quick overview: CPU frequency, battery, network, apps, display, RAM/storage usage rings
- **Hardware** — CPU (cores, ABI, max frequency), GPU renderer, board/platform, RAM
- **System** — Android version, SDK, build ID, security patch, kernel, fingerprint
- **Battery** — full raw `dumpsys battery` breakdown
- **Network** — IP, hostname, interfaces, WiFi connection details
- **Apps** — total/user/system counts, searchable list of installed user apps
- **Camera** — per-camera specs (megapixels, aperture, focal length, sensor size, ISO/shutter range where available) and feature flags
- **Sensors** — full sensor list with vendor/model, tap to expand technical parameters (range, power, delay)
- **Graphics** — OpenGL ES vendor/renderer/version + extension list, Vulkan feature flags & driver detection
- **Disk** — mounted volumes (`df -h`) and raw `/proc/partitions`

Each tab loads its own data on demand (lazy-loaded), so opening the module doesn't run every command at once.

## Installation

1. Download the latest release ZIP (or clone this repo and zip `module.prop`, `action.sh`, `webui/`, `banner.png`)
2. In Shevery or Nightzuku: **ADB Modules → Install ZIP**
3. Enable the module
4. Set access mode to **Full access** (some `dumpsys` calls need it — Safe mode may return partial data)
5. Open the module card → **WebUI**

## Notes

- Vulkan detection relies on `pm list features` and driver file presence under `/vendor/lib64/hw` / `/system/lib64/hw` — most stock Android builds don't ship a full `vulkaninfo`-style extension dump, so this only shows what the system itself reports.
- Camera specs come from this device's Camera2 characteristics dump; some vendors (notably Samsung) restrict or omit fields, so a dash means the system didn't report it here — not that the camera lacks it.
- Some WiFi/network fields may return empty on Safe mode due to permission restrictions.

## Changelog

### v2.0
- Added **Apps** tab (searchable list, package counts)
- Added **Camera** tab (real per-camera specs where the device exposes them)
- Added **Sensors** tab (expandable list with vendor/model + technical parameters)
- Fixed battery/WiFi/sensor parsing bugs on some devices
- Redesigned UI: icons, animations, nicer ring charts, collapsible extension list

### v1.0
- Initial release: Panel, Hardware, System, Battery, Network, Graphics, Disk

## License

This project is licensed under the **GNU General Public License v3.0** — see [LICENSE](LICENSE) for details.

## Author

[HaydarReiss31](https://github.com/HaydarReiss31)
