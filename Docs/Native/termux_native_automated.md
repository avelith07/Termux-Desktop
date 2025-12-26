# Full Termux Desktop
#### Automatic Installation
Full Termux Desktop installation guide, automatic/script installation
## Navigation
- **[Key features](#key-features)**
- **[Requirments](#termux-needed)**
- **[Installation Process](#termux-auto-install)**
- **[How to use the Desktop](#desktop-usage)**
- **[Troubleshooting & Fixes](#fix-problem-termux)**

<br>

## Key Features <a name=key-features></a>
Here are the goodies of automatic installation
- **Easy Setup:** Easy auto installation process.
- **Hardware Acceleration:** Performance boost using your supported hardware. *Currently only implemented for Vulkan-supported Mali GPU and Adreno 6xx/7xx (except: 710, 642L, 720 & 730). If you have non Vulkan supported Mali GPU or other Adreno GPUs then [Click here](/Docs/Termux/hwa_setup.md) or proceed with no hardware acceleration (CPU Rasterizer)*
- **Audio Support:** Desktop audio functional
- **Quick Reminders:** During installation, if you have Termux API installed then it will remind you when there's a user input needed by using Android's TTS
- **One-Click Browser Installation:** Firefox, Chromium
- **One-Click Application Installation:** several apps you can choose what to install
- **GUI:** Termux X11
- **PRoot container:** Adds a PRoot distribution which is Debian, to enable full package compatibility.
- **PRoot apps on Native:** Has a script using that you can directly run commands inside PRoot from Termux native. Works for GUI, meaning you can use GUI on native without impacting the performance of the desktop.

Instead of direct installation of apps and few things, it will ask for user to give inputs making it more versatile.

---
<br>

## Requirments <a name=termux-needed></a>
> [!WARNING]
> (NEVER USE THE GOOGLE PLAY STORE VERSION OF TERMUX AS IT IS OUTDATED)
- [Install **Termux** from GitHub](https://github.com/termux/termux-app/releases)
- [Install **Termux X11** from GitHub](https://github.com/termux/termux-x11/actions/workflows/debug_build.yml)
- [Install **Termux API** from GitHub](https://github.com/termux/termux-api/releases)

> [!NOTE]
> If any of the Termux app, getting failed to install then remember. ONLY install all Termux apps from GitHub and MAKE SURE to turn off Google Play Protect temporarily

#### Specs Requirements
- Android version must be 9 or above
- [Termux](https://github.com/termux/termux-app/releases)
- [Termux X11](https://github.com/termux/termux-x11/actions/workflows/debug_build.yml)
- [Termux API](https://github.com/termux/termux-api/releases) 
- Minimum 2GB of RAM; Recommended 3GB of RAM
- 700MB - 1.2 GB of internet
- Minimum 4GB of storage; Recommended 5.5+ GB of storage if you plan to install quite a lot of applications

---
<br>

## Installation Process <a name=termux-auto-install></a>
Update and upgrade all of Termux packages:
```
pkg update
pkg upgrade -y
```
Install `wget` and download the script:
```
pkg install -y wget
wget -O termux-desktop-installation.sh https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/Scripts/termux-desktop-installation.sh
```
Give executable permission to the script:
```
chmod +x termux-desktop-installation.sh
```
Run it and enjoy!
```
./termux-desktop-installation.sh
```

> [!TIP]
> During the installation it will ask for user to input, but if you have Termux API installed, then the script will use TTS to remind you

> [!WARNING]
> If you use Hardware Acceleration, then V-Sync gets disabled for smoother and faster performance at cost of a slight tearing

---
<br>

## How to use the Desktop
In order to know how to use the desktop, what's the command to start the desktop, how to use PRoot applications on Termux native and many other utilities, just tap on *Click here* button

### [Click here](/Docs/Termux/termux_desktop_usage)

---
<br>

## Troubleshooting and fixes <a name=fix-problem-termux></a>
### Termux X11 randomly getting killed/shutdown or freezed or signal error

- **Android 11 & below** — you need to give Background Activity permission to Termux (and preferably Termux X11). Either you can give manually or run this command on Termux `termux-wake-lock` it will pop up asking for the permission, give it.
- **Android 12 & 13** — You need to disable Phantom Processes using [this guide](https://github.com/EDLLT/TermuxDisablePhantomProcess) 
- **Android 14 or later** — Go to Settings, Developer Options and find *Disable Child Process Killer* (the name may be slightly different) and enable that to disable the killer

**If** Termux X11 STILL abruptly gets killed even after disabling Phantom Processes then apply this to both the Termux app AND Termux X11 https://dontkillmyapp.com/

> [!WARNING]
> Doing above things means you are making Termux to run forever without getting killed. So, each time if you want to close, restart, stop Termux/Desktop. You have to open app info of Termux and *Force Stop* it from there

### Termux:X11's resolution is too big/too small. Cursor issues and cursor's speed is too fast/slow

- **To fix the resolution** — Pressing the android back key or going home then back to Termux:X11 usually fixes the resolution
- **To fix desktop looks too small or big** — On the other hand, if you find the icons/UI to be too small then you could close the termux:x11 session, go to "Preferences"(ONLY APPEARS IF THE TERMUX X11 SESSION IS NOT RUNNING) and change display resolution mode to scaled then drag the Display Scale % to something that you're satisfied with.
- **To change cursor settings** — Get into termux:X11's preferences, then enable "Capture external pointer devices when possible" and drag the "Captured pointer speed factor, %" to something you feel comfortable with.

### Hardware Acceleration or Desktop problem
As I said earlier, if you have other Adreno or Vulkan unsupported GPU, you can't use Hardware Acceleration from automatic installation. You have to do it manually by the guide, for the guide tap on "Click here" button
#### [Click here](/Docs/Termux/hwa_setup.md)

> [!NOTE]
> If you already messed up with Hardware Acceleration, you can either fix it manually by the guide and your knowledge. But if you are a beginner, consider doing *Clear data* of Termux and do everything from beginning, or get a support from Linux enthusiast

### If you have any other problem, [Click here](/Docs/Termux/problem_fix.md)
