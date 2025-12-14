# Full Termux Desktop
#### Manual Installation
Full Termux Desktop installation guide, manual
## Navigation
- **[Requirements](#termux-needs)**
- **[First Steps](#first-steps-termux)**
- **[Hardware Acceleration Setup](#hwa-setup-bhai)**
- **[Useful User Scripts](#user-scripts)**
- **[Install your desired applications](#app-install-bhai)**
- **[Install the Desktop](#desktop-install-bhai)**
- **[Install Desktop startup scripts](#script-download)**
- **[How to use the Desktop](#desktop-usage)**
- **[Troubleshooting and Fixes](#fix-problem-termux)**

<br>

## Requrements <a name=termux-needs></a>
Requirments to install the desktop on your Termux.
- Android version must be 8-9+
- [Termux](https://github.com/termux/termux-app/releases)
- [Termux X11](https://github.com/termux/termux-x11/actions/workflows/debug_build.yml)
- [Termux API](https://github.com/termux/termux-api/releases) (**Also needed nowadays**)
- Minimum 2GB of RAM; Recommended 3GB of RAM
- 500 MB - 1000 MB of internet
- Minimum 4GB of storage; Recommended 5.50 GB of storage

> [!NOTE]
> If any of the Termux app, getting failed to install then remember. ONLY install all Termux apps from GitHub and MAKE SURE to turn off Google Play Protect temporarily

---
<br>

## First Steps <a name=first-steps-termux></a>
Make sure you've Termux, Termux X11 & Termux API installed. If didn't, install it from the link:
> [!WARNING]
> (NEVER USE THE GOOGLE PLAY STORE VERSION OF TERMUX AS IT IS OUTDATED)
> (ALWAYS DOWNLOAD AMD INSTALL TERMUS AND ITS APPS FROM GITHUB)
- [Install Termux from GitHub](https://github.com/termux/termux-app/releases)
- [Install Termux X11 from GitHub](https://github.com/termux/termux-x11/actions/workflows/debug_build.yml)
- [Install Termux API from GitHub](https://github.com/termux/termux-api/releases)

Update and upgrade all packages:
```
pkg update
pkg upgrade -y
```
Give background activity permission to Termux to make it run on background:
```
termux-wake-lock
```
> [!NOTE]
> After running, make sure to give it the background permission for a smooth experience.

<br> 

<details>
  <summary>Tap if you are experiencing slow speed</summary>
	
1. Install `wget` by executing:
```
pkg install -y wget
```
2. Download `termux-fastest-repo` script and give it permission to run:
```
cd ~
wget -O termux-fastest-repo-temp.sh https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/termux-fastest-repo
chmod +x termux-fastest-repo-temp.sh
```
3. Execute the script:
```
./termux-fastest-repo-temp.sh
```
4. Delete the script, *will be added later, no need to keep*:
```
rm -rf ~/termux-fastest-repo-temp.sh
```
**Slow speed problem is fixed, now you can proceed**
</details>

<br> 

Install essential packages:
```
pkg install -y x11-repo
pkg install -y termux-x11-nightly
pkg install -y tur-repo
pkg install -y termux-api
pkg install -y python
pkg install -y proot-distro
pkg install -y rsync
pkg install -y wget
```
**First steps are completed**

---
<br>

## Setting up Hardware Acceleration <a name=hwa-setup-bhai></a>
In order to get hardware acceleration run following commands:
> [!WARNING]
> This Hardware Acceleration setup is only for peoples who have a Mali GPU with Vulkan-supported or Adreno 6xx/7xx (except 710, 642L, 720 & 730) 
> For peoples who have any other Adreno or PowerVR GPU, skip HWA (stick with CPU rasterization) and go to next navigation/section or check out [Hardware Acceleration Setup](/Docs/Termux/hwa_setup.md)
If you have Mali GPU with Vulkan-supported or Adreno 6xx/7xx (except: 710, 642L, 720 & 730), proceed:

<br>

<details>
  <summary>Tap if you have Vulkan supported Mali GPU</summary>

Install `mesa-zink`, `mesa-zink-dev` and following packages
```
apt install -y virglrenderer-mesa-zink vulkan-loader-generic angle-android virglrenderer-android libandroid-shmem libc++ libdrm libx11 libxcb libxshmfence libwayland zlib zstd 

apt --fix-broken install -y
```
Download & install Vulkan Wrapper Android for Vulkan support:
```
wget -O vulkan-icd.deb https://github.com/Prime-TITAN-CameraMan/Termux-Desktop/releases/download/v25.0.0-2/vulkan-wrapper-android_25.0.0-2_aarch64.deb

apt install -y ./vulkan-icd.deb
apt --fix-broken install -y
```
Remove the directory & its files it is not longer needed:
```
cd ~
rm -rf ~/Temp-HWA-TCM
```
**Completed. Now your Hardware Acceleration must be working.**

</details>

<br>

<details>
  <summary>Tap if you have Adreno 6xx/7xx (except: 710, 642L, 720 & 730)</summary>

Install `mesa-zink` and other packages using the following command:
```
apt install -y virglrenderer-mesa-zink vulkan-loader-generic angle-android virglrenderer-android libandroid-shmem libc++ libdrm libx11 libxcb libxshmfence libwayland zlib zstd mesa-vulkan-icd-freedreno-dri3

apt --fix-broken install -y
```
Download & install Vulkan Wrapper Android for Vulkan support:
```
mkdir -p ~/Temp-HWA-TCM
cd ~/Temp-HWA-TCM

wget -O vulkan-icd.deb https://github.com/Prime-TITAN-CameraMan/Termux-Desktop/releases/download/v25.0.0-2/vulkan-wrapper-android_25.0.0-2_aarch64.deb

apt install -y ./vulkan-icd.deb
apt --fix-broken install -y
```
Remove the directory & its files it is not longer needed:
```
cd ~
rm -rf ~/Temp-HWA-TCM
```
**Completed. Now your Hardware Acceleration must be working.**

</details>

---
<br>

## Install user-friendly useful scripts <a name=user-scripts></a>
A collection of scripts, which you can use to automate everything, it is useful for daily-life. Mainly it will make the Termux and desktop easy to use. Each script usage is written down below

Run following command to install it:
```
mkdir -p ~/bin
cd ~/bin

wget -O apphwa https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/apphwa
wget -O native_cleaner https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/native_cleaner
wget -O proot_program https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/proot_program
wget -O termux-fastest-repo https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/termux-fastest-repo
wget -O desktop-help https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/desktop-help
wget -O termux-multi-instance https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/termux-multi-instance
```
Give executable permission to those scripts:
```
chmod +x apphwa
chmod +x native_cleaner
chmod +x proot_program
chmod +x termux-multi-instance
chmod +x termux-fastest-repo
chmod +x desktop-help
```
Now run following commands to add the directory to the path for executing those scripts anywhere:
```
echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
cd ~
source .bashrc
```
To check what script does what you can run `desktop-help` for check-in each scripts work.

**User-friendly scripts installation is completed**

---
<br>

## Install Desired Applications <a name=app-install-bhai></a>
You can install various GUI/CLI applications on Termux native.

**At first update your repository:**
```
pkg update
```
If you want to install Firefox:
```
pkg install -y firefox
```
If you want to install Chromium:
```
pkg install -y chromium
```
If you want to install VLC:
```
pkg install -y vlc
```
If you want to install MPV:
```
pkg install -y mpv
```
If you want to install VS Code (`code-oss`):
```
pkg install -y code-oss
```
If you want to install Telegram:
```
pkg install -y telegram-desktop
```
If you want any other application then run:
```
apt list
```
It will list every packages available on all repos. Which you can install by running `pkg install packagename` or without confirmation `pkg install -y packagename`

**Desire apps installation is completed**

---
<br>

## Install the desktop <a name=desktop-install-bhai></a>
Let's install the XFCE4 desktop environment, and few essential utilities.

Run the following command to install XFCE4:
```
pkg install -y xfce4
```
Install some essential utilities for better user experience: *these must be installed for better functionality & features*
```
pkg install -y xfce4
pkg install -y xfce4-goodies
pkg install -y xfce4-whiskermenu-plugin
pkg install -y xfce4-battery-plugin
pkg install -y xfce4-taskmanager
pkg install -y fastfetch
pkg install -y xfce4-screenshooter
pkg install -y mousepad
```

**Desktop installation is done**

---
<br>

## Download script to start  the desktop: <a name=script-download></a>
In order to start the you have to download the script to start it.

Run the following command to create a `bin` and add the PATH, if you haven't before yet. If you don't know about of you have done or not then run it:
```
mkdir -p ~/bin
echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
cd ~
source .bashrc
```

Now you have to download the script which starts the desktop.

<br>

<details>
  <summary>Tap If you have done Hardware Acceleration process above then do this process</summary>

#### If you have done Mali GPU  setup then:
Download the desktop start up script inside bin directory:
```
cd ~/bin
wget -O termux-xfce4 https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/DE%20Startup%20Scripts/termux-xfce4-mali.sh
```
Give it permission to run:
```
chmod +x termux-xfce4
```
To run the desktop run the command anywhere:
```
termux-xfce4
```

---

#### If you have done Adreno GPU setup
Download the desktop start up script inside bin directory:
```
cd ~/bin
wget -O termux-xfce4 https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/DE%20Startup%20Scripts/termux-xfce4-adreno.sh
```
Give it permission to run:
```
chmod +x termux-xfce4
```
To run the desktop run the command anywhere:
```
termux-xfce4
```

---

> [!NOTE]
> Hardware Acceleration is enabled alongwith disabling V-Sync, at cost slight tearing and graphical glitches which may come rarely

</details>

<br>

<details>
  <summary>Tap If you have not done Hardware Acceleration process above due to Adreno GPU or any other reason then do this process</summary>

1. Download the script inside `bin` directory:
```
cd ~/bin
wget -O termux-xfce4 https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/DE%20Startup%20Scripts/termux-xfce4-cpu.sh
```
Give it permission to run:
```
chmod +x termux-xfce4
```
To run the desktop run the command anywhere:
```
termux-xfce4
```
Remember it is not Hardware Accelerated, so the performance will be slow. If you want to setup HWA by yourself check out [Hardware Acceleration Doc](/Docs/Termux/hwa_setup.md)

</details>

**Desktop startup script installation is done**

---
<br>

## How to use the Desktop <a name=desktop-usage></a>
In order to know how to use the desktop, what's the command to start the desktop, how to use PRoot applications on Termux native and many other utilities, just tap on *Click here* button

### [Click here](/Docs/Termux/termux-desktop-usage.md)

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
As I said earlier, if you have Adreno or Vulkan unsupported GPU, you can't use Hardware Acceleration from automatic installation. You have to do it manually by the guide, for the guide tap on "Click here" button
#### [Click here](/Docs/Termux/hwa_setup.md)

> [!NOTE]
> If you already messed up with Hardware Acceleration, you can either fix it manually by the guide and your knowledge. But if you are a beginner, consider doing *Clear data* of Termux and do everything from beginning, or get a support from Linux enthusiast

### If you have any other problem, [Click here](/Docs/Termux/problem_fix.md)
