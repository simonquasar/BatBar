# 🔋 BatBar | The Battery Bar

![Static Badge](https://img.shields.io/badge/11%20%2F%2010-%20?logo=gitforwindows&label=WINDOWS&color=318ce7)
![Static Badge](https://img.shields.io/badge/Ubuntu%2FDebian-%20?logo=ubuntu&label=LINUX&color=E95420)
![Static Badge](https://img.shields.io/badge/Arch%2FFedora-%20?logo=linux&label=LINUX&color=ffcc33)
![Static Badge](https://img.shields.io/badge/compatible-%20?logo=apple&label=MAC%20OS&color=azure)

![Static Badge](https://img.shields.io/badge/Windows-%20?logo=phpstorm&logoColor=1292EE&label=PowerShell&color=1292EE)
![Static Badge](https://img.shields.io/badge/Unix%2FmacOS-%20?logo=python&logoColor=green&label=Python&color=84A454)
![GitHub file size in bytes](https://img.shields.io/github/size/simonquasar/BatBar/ps%2FBatBar.exe?label=.exe)
![GitHub Release](https://img.shields.io/github/v/release/simonquasar/BatBar?display_name=release&color=green)

---


**BatBar** is an ultra-minimalist battery indicator for Windows and Linux. 
It displays a **1-pixel-wide** colored line on the edge of your screen, giving you an immediate, unobtrusive view of your battery level. 

**Always visible, never distracting.**

> 🖼️ **“Screenshot-safe"** ❗
> **BatBar** sits on the extreme edge of your screen - typically outside the active capture area used by most print screens.  
> _You can still increase its width if needed, but 1px is the sweet spot for invisibility!_

**Ideal for streamers, designers and screen recorders!**

![BatBar | Battery Bar 1px wide](https://github.com/simonquasar/BatBar/blob/main/BatBar.jpg)

----

## 💻 BatBar | on the edge of your screen

- 👀 **Instant visual feedback**: the height of the bar shows your battery level
- 🚦 **Intuitive color coding**: just simple red orange yellow green + blue hints
- 📸 **Screenshot-safe**: invisible in most screenshots and screen recordings
- 📌 **Always on top**: stays above all windows, always there
- 🖱️ **Adjustable**: just scroll the mouse wheel over the bar to resize it
- 🫥 **Non-intrusive design**: minimalist and out of the way

## 🪫 How to

The bar automatically appears on the right edge of your primary screen.

- ↔️ **Adjust width**: `mouse wheel` `up/down` over the bar (1-10 px)
- ❌ **Close the bar**: `SHIFT + right-click` on the bar

## ⚡ Resources

This utility is designed to be extremely lightweight:

- 📦 **Tiny**: 61KB Windows _.exe_ / ~12MB Linux package
- 💾 **Memory**: <20MB RAM usage
- 🔄 **CPU**: < 0.1% idle, 0.1-0.3% during updates (every 5s)
- 🔋 **Battery**: Negligible impact
- 🚀 **Simple**: Instant launch, no dependencies

Runs silently in the background without impacting system performance.

Most battery indicators are cluttered, over-engineered or get in your - and your system resources' - way. 

**BatBar** focuses on pure function with an aesthetic that’s nearly invisible, also for your system. 
The solution for developers, creatives and minimalists who want instant battery awareness without distractions.

## ⏬ Download

### Windows 10/11 

#### 🔸 Option 1: ✅ Standalone Executable (recommended) 
1. Download the latest release (`BatBar.exe`) from the [Releases](https://github.com/simonquasar/batbar/releases) page
2. Run the executable

#### 🔹 Option 2: PowerShell Script
- requires: PowerShell 5.1+ 
1. Download `BatBar.ps1`
2. Right-click the file and select “_Run with PowerShell_”

---

### Linux (Debian/Ubuntu)

#### 🔸 ✅ Standalone Executable (recommended)
1. Download the latest release (`BatBar`) from the [Releases](https://github.com/simonquasar/batbar/releases) page
2. Make the file executable:  
   `chmod +x BatBar`
3. Run:  
   `./BatBar`

---

### Linux & MacOS

#### 🔹 Python Script
- requires: Python 3.7+ and the `psutil` package  
1. Download `BatBar.py`
2. Install the required dependency:  
   `pip install psutil`
3. Run with:  
   `python3 BatBar.py`

---
## 📜 License

This project is licensed under the **GNU General Public License v2.0**  
See the full license text [here](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html).

---

> Designed for simplicity by [simonquasar](https://www.simonquasar.net)
