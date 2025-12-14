# Termux-Desktop
**Install a full Linux desktop environment on your Android device with Termux X11 and also with hardware acceleration alongwith desktop audio functional**

### Initial release 
If you find any error, bug, glitch or something is not working. Please contact me on my Discord server, link is on the repository website, or create a issue.

---
<br>

## Navigation
- **[Requirements](#termux-needs)**
- **[First Steps](#first-steps)** — 
- **[Native VS PRoot](#choose-linux)** 
- **[Native & PRoot Details Sheet](#comparing-sheet)** 
- **[How to install Full Termux Desktop (manually)](#termux-native)** 
- **[How to Install Full Termux Desktop (Fully Automated)](#termux-native-auto)** 
- **[How to install a PRoot Distribution with desktop](#proot-distributions)** — **Not recommended, check *How to install Full Termux Desktop* for the reason**
- **[How to fix Termux Storage, Microphone and Other Services Problem in Desktop](#termux-problem-fix)** 
- **[How to setup Hardware Acceleration](#hwa-setupa)** 
> [!WARNING]
> If you are using Mali GPU, or Adreno 6xx/7xx (except 710, 642L, 720 & 730) you don't need to setup HWA manually, in my Termux Desktop installation process it is included.
> If you use any other Adreno GPU then my script does not have automated HWA for it. So, you have to set it up manually through the documentation process guide

<br>

## Basic Termux Requirements <a name=termux-needs></a>
The basic Termux requirments to install Termux on your Android without any problem
- Android version must be 8 or higher
- Minimum 512MB of RAM; Recommended 1.5GB of RAM
- 50MB - 100MB of internet data for base Termux packages
- Minimum 150MB of storage; Recommended 300MB of storage

---
<br>

## First Steps <a name=first-steps></a>
We are going to use Termux and Termux X11 in order to have a full Linux Desktop in our Android devices.
> [!WARNING]
> (NEVER USE THE GOOGLE PLAY STORE VERSION OF TERMUX AS IT IS OUTDATED)
> (NEVER TRY TO INSTALL TERMUX AND ITS APPS FROM DIFFERENT SOURCES, ALWAYS INSTALL FROM GITHUB)
- [Install Termux from GitHub repository](https://github.com/termux/termux-app/releases)
- [Install Termux X11 from last successful builds of GitHub repository](https://github.com/termux/termux-x11/actions/workflows/debug_build.yml)

Update & Upgrade all of Termux packages:
```
pkg update
pkg upgrade -y
```
Install essential packages in Termux:
```
pkg install -y x11-repo
pkg install -y termux-x11-nightly
pkg install -y pulseaudio
pkg install -y tur-repo
pkg install -y termux-api
pkg install -y proot-distro
```

---
<br>

# Termux native VS PRoot-distro <a name=choose-linux></a>

### [1. Termux Native](#termux-native)

Termux native refers to running Linux commands directly within the Termux app without any additional virtualization or containerization. It provides a lightweight and straightforward way to access Linux utilities on your Android device. 

### [2. Proot-Distro](#proot-distributions)

Proot-Distro is a method that utilizes `proot` (PRoot is a user-space implementation of chroot, mount --bind, and binfmt_misc) to run a full Linux distribution inside a chroot environment. This approach allows you to install and use a wide range of Linux distributions without root access. However, it may have some limitations compared to native installations.

#### Summary

- **Termux Native:** Simple and lightweight, but with limited capabilities compared to full Linux distributions.
- **Proot-Distro:** Allows running full Linux distributions without root access, but may have some limitations.

<hr style="width: 30%; height: 2px; background-color: gray; border: none; margin: auto;">
<br>

## Comparison of Linux Environments on Android <a name=comparing-sheet></a>
| Feature             | Proot          | Native         |
|---------------------|----------------|----------------|
| Needs Root?         | ❌ (No)        | ❌ (No)        |
| Many Linux Apps?    | ✅ (Yes)       | ❌ (Limited)   |
| Performance         | Moderate 💼    | Good 🚀        |

---
<br>

## How to install Full Termux Desktop (Manually) <a name=termux-native></a>
In order to install the full XFCE4 desktop environment on Termux you have visit the documentation down below. Manually means you have to copy and paste each commands, good for power users
### [Click here](/Docs/Native/termux_native.md)

---
<br>

## How to Install Full Termux Desktop with 1-Click (Automated) <a name=termux-native-auto></a>
To install the desktop without doing hardwork, you can use the automated script check the documentation below
### [Click here](/Docs/Native/termux_native_automated.md).

---
<br>

## How to install proot distribution desktop: Debian & Ubuntu <a name=proot-distributions></a>
Click on the different text to see how you can install PRoot distributions of your choice. Alongwith XFCE4 desktop environment. 
### [Click here](/Docs/PRoot/proot_distro.md)

> [!WARNING]
> Not recommended, because of slowness and instability check *How to install Full Termux Desktop* because if you use the manual or automated process you can also utilise PRoot usage into your Termux native desktop, so you can use PRoot commands and apps on Termux native so you desktop and other applications performance gets no impact meaning HW accelerated

---
<br>

## How to fix several services problem in Termux <a name=termux-problem-fix></a>
In order to fix services issue such as Microphone, Camera, etc. on Termux, you have to install an additional package & app. Tap on *Click Here* to do it.
### [Click here](/Docs/Termux/problem_fix.md)

---
<br>

## How to setup Hardware Acceleration manually on Termux <a name=hwa-setupa></a>
You can setup hardware acceleration on your Android manually if you want. But remember if you've a Vulkan-supported Mali GPU then my script will automatically set it up for you by it uses Zink and Vulkan Wrapper Android. If you are a power user want to change HWA or you have an Adreno GPU then tap on *Click here*
### [Click here](/Docs/Termux/hwa_setup.md)
