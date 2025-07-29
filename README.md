# BatBar | 1-px battery bar 

---

**BatBar** is the 1-pixel wide battery bar. Un ultra-minimalist status indicator for Windows, Linux, and macOS.
It consists of **a single-pixel line** that shows your battery level.

[![GitHub repo](https://img.shields.io/badge/GitHub-BatBar-white?logo=github)](https://github.com/simonquasar/BatBar)
![GitHub Release](https://img.shields.io/github/v/release/simonquasar/BatBar?display_name=release&color=green)

![Static Badge](https://img.shields.io/badge/11%20%2F%2010-%20?logo=quarto&logoColor=lightblue&label=WINDOWS&color=318ce7)
![Static Badge](https://img.shields.io/badge/Ubuntu%2FDebian%2FArch-%20?logo=linux&label=LINUX&color=E95420)
![Static Badge](https://img.shields.io/badge/compatible-%20?logo=apple&label=MAC%20OS&color=azure)

![Static Badge](https://img.shields.io/badge/Windows-%20?logo=phpstorm&logoColor=1292EE&label=PowerShell&color=1292EE)
![Static Badge](https://img.shields.io/badge/Unix%2FmacOS-%20?logo=python&logoColor=green&label=Python&color=84A454)


## Key Features

---

**<p align="center">Always visible. Never distracting.</p>**
- **Instant visual feedback**: the height of the bar reflects the battery level
- **Intuitive color coding**: simple red-orange-yellow-green + blue for charging
- **Always on top**: persistent visibility, zero distraction
- **Adjustable witdh**: scroll to resize


**<p align="center">Screenshot-safe: designed to hide in plain sight.</p>**


![BatBar](https://raw.githubusercontent.com/simonquasar/BatBar/main/BatBar.jpg)

**BatBar** sits on the extreme edge of your screen - typically outside the active capture area used by most print screens.

_You can still increase its width, while 1px remains the sweet spot for invisibility!_

**<p align="center">Ideal for streamers, designers and screen recorders!</p>**

---

## Usage

**<p align="center">Non-intrusive design: minimalism taken seriously.</p>**

The bar automatically appears on the right edge of your primary screen.

- ↔️ **Adjust width** (1-10 px) with `mouse wheel` `up/down` 
- ❌ **Close the bar** by pressing `SHIFT + right-click` on it

That's it!

---

## Resources

**<p align="center">BatBar** is made for creators, coders, productivity purists and minimalists - people who care about signal over noise.</p>

This widget is designed to be extremely lightweight (both visually and on system resources), runs silently in the background without impacting system performance:

- **Size**: `51KB .exe` | `~12MB deb` | `~6KB .ps1 & .py`
- **Memory**: <20MB RAM usage
- **CPU**: ~0.1% idle, <0.3% during updates (every 5s)
- **Battery**: virtually zero

Most battery indicators are cluttered, over-engineered, and demand system resources or some interaction.
**BatBar** delivers pure functionality with a nearly invisible aesthetic that stays out of your way while keeping you informed.
The solution for who wants **instant battery awareness without distractions**.

---

## ⏬ Download

from the [GitHub Releases](https://github.com/simonquasar/batbar/releases) page

### Windows 10/11

#### 🔹 Option 1: Standalone Executable (recommended) ✅
1. Download the latest release (`BatBar.Windows.x86_64.exe`) ![GitHub file size in bytes](https://img.shields.io/github/size/simonquasar/BatBar/ps%2FBatBar.exe?label=.exe&color=318ce7&link=https%3A%2F%2Fgithub.com%2Fsimonquasar%2FBatBar%2Freleases%2Flatest)
2. Run - that's it.

#### 🔹 Option 2: PowerShell Script
- requires: PowerShell 5.1+
1. Download `BatBar.ps1` ![GitHub file size in bytes](https://img.shields.io/github/size/simonquasar/BatBar/ps%2FBatBar.ps1?label=.ps1&color=1292EE&link=https%3A%2F%2Fgithub.com%2Fsimonquasar%2FBatBar%2Freleases%2Flatest)
2. Right-click the file and select “_Run with PowerShell_”

### Linux (Debian/Ubuntu)

#### Standalone Executable (recommended) ✅
1. Download the latest release (`BatBar.Debian`) ![GitHub file size in bytes](https://img.shields.io/github/size/simonquasar/BatBar/py%2FBatBar?link=https%3A%2F%2Fgithub.com%2Fsimonquasar%2FBatBar%2Freleases%2Flatest)
2. Make the file executable:
   `chmod +x BatBar`
3. Run:
   `./BatBar`

### Linux & MacOS

#### 🔹 Python Script
- requires: Python 3.7+ and the `psutil` package
1. Download `BatBar.py` ![GitHub file size in bytes](https://img.shields.io/github/size/simonquasar/BatBar/py%2FBatBar.py?label=.py&color=84A454&link=https%3A%2F%2Fgithub.com%2Fsimonquasar%2FBatBar%2Freleases%2Flatest)
2. Install the required dependency:
   `pip install psutil`
3. Run with:
   `python3 BatBar.py`

---

## License

This project is licensed under the **GNU General Public License v2.0**
See the full license text [here](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html).


👤 _Crafted with minimalism by [simonquasar](https://www.simonquasar.net)_
