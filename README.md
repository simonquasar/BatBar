# 🔋 BatBar | The Battery Bar 1-pixel wide

---

![GitHub Release](https://img.shields.io/github/v/release/simonquasar/BatBar?display_name=release&color=green)
[![GitHub repo](https://img.shields.io/badge/GitHub-BatBar-white?logo=github)](https://github.com/simonquasar/BatBar)
![Static Badge](https://img.shields.io/badge/11%20%2F%2010-%20?logo=quarto&logoColor=lightblue&label=WINDOWS&color=318ce7)
![Static Badge](https://img.shields.io/badge/Ubuntu%2FDebian%2FArch-%20?logo=linux&label=LINUX&color=E95420)
![Static Badge](https://img.shields.io/badge/compatible-%20?logo=apple&label=MAC%20OS&color=azure)
![Static Badge](https://img.shields.io/badge/Windows-%20?logo=phpstorm&logoColor=1292EE&label=PowerShell&color=1292EE)
![Static Badge](https://img.shields.io/badge/Unix%2FmacOS-%20?logo=python&logoColor=green&label=Python&color=84A454)

**BatBar** is an ultra-minimalist battery indicator for Windows, Linux, and macOS.
**A single-pixel line** that shows your battery level.

## Key Features
**<p align="center">Always visible. Never distracting.</p>**
- **Instant visual feedback**: the height of the vertical bar reflects battery level
- **Intuitive color coding**: just simple red-orange-yellow-green + blue hints
- **Always on top**: persistent visibility without distraction
- **Adjustable**: scroll to resize the width

---

**<p align="center">Screenshot-safe: designed to hide in plain sight.</p>**

**BatBar** sits on the extreme edge of your screen - typically outside the active capture area used by most print screens.
_You can still increase its width if needed, but 1px is the sweet spot for invisibility!_

![BatBar](https://raw.githubusercontent.com/simonquasar/BatBar/main/BatBar.jpg)

**<p align="center">Ideal for streamers, designers and screen recorders!</p>**
**<p align="center">BatBar** is made for creators, coders, productivity purists and minimalists - people who care about signal over noise. Runs silently in the background without impacting system performance.</p>

---

## Usage

**<p align="center">Non-intrusive design: minimalism taken seriously.</p>**

The bar automatically appears on the right edge of your primary screen.

- ↔️ **Adjust width**: `mouse wheel` `up/down` over the bar (1-10 px)
- ❌ **Close the bar**: `SHIFT + right-click` on the bar

## Resources

This widget is designed to be extremely lightweight (both visually and on system resources):

- **Size**: 51KB `.exe` | ~12MB Linux | ~6KB `.ps1` & `.py`
- **Memory**: <20MB RAM usage
- **CPU**: ~0.1% idle, <0.3% during updates (every 5s)
- **Battery**: virtually zero

Most battery indicators are cluttered, over-engineered, and demand system resources or some interaction.
**BatBar** delivers pure functionality with a nearly invisible aesthetic that stays out of your way while keeping you informed.
The solution for who wants **instant battery awareness without distractions**.

---

## ⏬ Download

### Windows 10/11

#### 🔹 Option 1: Standalone Executable (recommended) ✅
1. Download the latest release (`BatBar.exe`) from the [GitHub Releases](https://github.com/simonquasar/batbar/releases) page ![GitHub file size in bytes](https://img.shields.io/github/size/simonquasar/BatBar/ps%2FBatBar.exe?label=.exe&color=318ce7&link=https%3A%2F%2Fgithub.com%2Fsimonquasar%2Fbatbar%2Freleases)
2. Run - that's it.

#### 🔹 Option 2: PowerShell Script
- requires: PowerShell 5.1+
1. Download `BatBar.ps1` from the [GitHub Releases](https://github.com/simonquasar/batbar/releases) page ![GitHub file size in bytes](https://img.shields.io/github/size/simonquasar/BatBar/ps%2FBatBar.ps1?label=.ps1&color=1292EE&link=https%3A%2F%2Fgithub.com%2Fsimonquasar%2Fbatbar%2Freleases)
2. Right-click the file and select “_Run with PowerShell_”

### Linux (Debian/Ubuntu)

#### Standalone Executable (recommended) ✅
1. Download the latest release (`BatBar`) from the [GitHub Releases](https://github.com/simonquasar/batbar/releases) page ![GitHub file size in bytes](https://img.shields.io/github/size/simonquasar/BatBar/py%2FBatBar?label=Unix&color=E95420&link=https%3A%2F%2Fgithub.com%2Fsimonquasar%2Fbatbar%2Freleases)
2. Make the file executable:
   `chmod +x BatBar`
3. Run:
   `./BatBar`

### Linux & MacOS

#### 🔹 Python Script
- requires: Python 3.7+ and the `psutil` package
1. Download `BatBar.py` from the [GitHub Releases](https://github.com/simonquasar/batbar/releases) page ![GitHub file size in bytes](https://img.shields.io/github/size/simonquasar/BatBar/py%2FBatBar.py?label=.py&color=84A454&link=https%3A%2F%2Fgithub.com%2Fsimonquasar%2Fbatbar%2Freleases)
2. Install the required dependency:
   `pip install psutil`
3. Run with:
   `python3 BatBar.py`

## License

This project is licensed under the **GNU General Public License v2.0**
See the full license text [here](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html).


👤 _Crafted with minimalism by [simonquasar](https://www.simonquasar.net)_
