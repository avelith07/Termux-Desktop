# Hardware Acceleration Setup
#### Manual Setup
How to setup Hardware Acceleration in Termux. 
## Navigation
- **[Reminder](#bhaiminder)**
- **[First Steps](#bhai-steps)**
- **[HWA Installation Setup](#hwa-install-thai)**
- **[How to use HWA](#hwa-usage)**
- **[How to use HWA in PRoot](#proot-hwa)** — Probably the setup won't come


<br>

## Reminder <a name=bhaiminder></a>
- **Vulkan Supported Mali GPU** — If you have Vulkan supported Mali or PowerVR GPU then we are going to use for **Zink** for GL Hardware Acceleration, and **Vulkan Wrapper Android** ICD for Vulkan support and to make Zink work.
- **Vulkan Unsupported Mali GPU** — Unfortunately, you can't HWA through this setup. You have to stick with CPU, or find a person/repository who/which can guide you to get Hardware Acceleration.
- **Adreno 6xx/7xx (except: 710, 641L, 720 & 730)** — If you have, we're going to use **Turnip** for Hardware Acceleration, and **Vulkan Wrapper Android** ICD for Vulkan support and to make Turnip work.

> [!NOTE]
> After listening to above criteria, even if you need some sort of HWA, then check out DroidMaster's terminology and his Hardware Acceleration setup, it may help you. Check it out by [Clicking here](https://github.com/LinuxDroidMaster/Termux-Desktops/blob/main/Documentation/HardwareAcceleration.md)

> [!WARNING]
> If you install the desktop from this repository (whether it's Automatic Installation or Manual) and followed each instructions then you won't need to setup Hardware Acceleration again manually, you can skip this.

---
<br>

## First Steps <a name=bhai-steps></a>
### Termux Native
In this section, you have to do few setups and install few packages before doing Hardware Acceleration process 

Run following commands to update and upgrade your packages:
```
pkg update
pkg upgrade -y
```
Install necessary repos and packages if you haven't:
```
pkg install -y x11-repo
pkg install -y termux-x11-nightly
pkg install -y tur-repo
```

**Basic installation setup is done**

---
<br>

## Termux native HWA setup <a name=hwa-install-thai></a>
In this section, we are going to setup Hardware Acceleration on our Termux native

<details>
  <summary>Tap, for Mali GPU HWA setup</summary>

### Mali GPU Hardware Acceleration setup
This setup is for Vulkan-supported Mali GPUs, if you have Adreno GPU scroll down and find a big text called "Adreno GPU Hardware Acceleration setup"

Download a newer custom build of mesa-zink for better compatibility and performance inside a directory using following commands:
```
mkdir -p ~/Temp-HWA-PTCM
cd ~/Temp-HWA-PTCM

wget -O mesa-zink_23.0.4-5_aarch64.deb https://github.com/Prime-TITAN-CameraMan/Termux-Desktop/releases/download/v23.0.4-5/mesa-zink_23.0.4-5_aarch64.deb
wget -O mesa-zink-dev_23.0.4-5_all.deb https://github.com/Prime-TITAN-CameraMan/Termux-Desktop/releases/download/v23.0.4-5/mesa-zink-dev_23.0.4-5_all.deb
```
Install mesa and its packages:
```
apt install -y ./*.deb
apt install -y virglrenderer-mesa-zink vulkan-loader-generic angle-android virglrenderer-android \
libandroid-shmem libc++ libdrm libx11 libxcb libxshmfence libwayland zlib zstd
```
Insure everything installed properly, if something broken happened then run:
```
apt --fix-broken install
```
**We've successfully installed Zink, now time to install an ICD for Vulkan support**

Download and install Vulkan Wrapper Android:
```
wget -O vulkan-icd.deb https://github.com/Prime-TITAN-CameraMan/Termux-Desktop/releases/download/v25.0.0-2/vulkan-wrapper-android_25.0.0-2_aarch64.deb

apt install -y ./vulkan-icd.deb
```
If something broken happened, run:
```
apt --fix-broken install
```
Delete files and directories those are no longer needed:
```
cd ~
rm -rf ~/Temp-HWA-PTCM
```
> [!NOTE]
> We installed **Vulkan Wrapper Android** for Vulkan support, and to make HWA work. If you have any problem with Vulkan Wrapper Android** then you can also use **Bionic Vulkan Wrapper** (known as: Vulkan Wrapper Android Leegao's Fork)

**We've successfully enabled Hardware Acceleration for Vulkan-supported Mali GPUs, now to utilise it, scroll down and find the section, or [Click here](#hwa-usage) to go there**

</details>

<br>

<details>
  <summary>Tap, for Adreno GPU HWA setup</summary>

## Adreno GPU Hardware Acceleration setup
This setup is for Adreno 6xx/7xx (except: 710, 642L, 720 & 730) GPUs, if you have Mali GPU, scroll up and follow the Mali setup, or if you have any other Adreno GPU then skip hardware acceleration.

Install mesa-zink and essential packages:
```
apt install -y mesa-zink mesa-zink-dev virglrenderer-mesa-zink vulkan-loader-generic angle-android virglrenderer-android \
libandroid-shmem libc++ libdrm libx11 libxcb libxshmfence libwayland zlib zstd
```
Install Mesa's Vulkan ICD Freedreno:
```
pkg install -y mesa-vulkan-icd-freedreno-dri3
```
Insure everything installed properly, if something broken happened then run:
```
apt --fix-broken install
```
**We've successfully installed Turnip, now time to install an ICD for Vulkan support**

Download and install Vulkan Wrapper Android:
```
wget -O vulkan-icd.deb https://github.com/Prime-TITAN-CameraMan/Termux-Desktop/releases/download/v25.0.0-2/vulkan-wrapper-android_25.0.0-2_aarch64.deb

apt install -y ./vulkan-icd.deb
```
If something broken happened, run:
```
apt --fix-broken install
```
Delete the file it's not longer needed:
```
rm -rf vulkan-icd.deb
```

> [!NOTE]
> We installed **Vulkan Wrapper Android** for Vulkan support, and to make HWA work. If you have any problem with Vulkan Wrapper Android** then you can also use **Bionic Vulkan Wrapper** (known as: Vulkan Wrapper Android Leegao's Fork)

**We've successfully enabled Hardware Acceleration for Vulkan-supported Mali GPUs, now to utilise it, scroll down and find the section, or [Click here](#hwa-usage) to go there**

</details>

---
<br>

## How to use Hardware Acceleration on Termux native <a name=hwa-usage></a>
We've successfully installed Vulkan Wrapper Android driver to use Hardware Acceleration, but to utilise it we've export few paths and variables. Check below.

<details>
  <summary>Tap, for Mali GPU HWA usage</summary>

### How to use HWA on Mali
In order to utilise Zink and Vulkan Wrapper Android, we have to run few commands.

Export `mesa` variables, its tunes and set the driver to Zink:
```
export MESA_NO_ERROR=1
export MESA_SHADER_CACHE_DISABLE=false
export MESA_NO_WAIT_FOR_VBLANK=1
export vblank_mode=0
export MESA_LOADER_DRIVER_OVERRIDE=zink
export GALLIUM_DRIVER=zink
export ZINK_DESCRIPTORS=lazy
export LIBGL_DRI3_ENABLE=1
```
If you need any compat tweak, then you can also add:
```
export MESA_GL_VERSION_OVERRIDE=4.3COMPAT 
export MESA_GLES_VERSION_OVERRIDE=3.2
```
Export Vulkan Wrapper ICD path:
```
export VK_ICD_FILENAMES=/data/data/com.termux/files/usr/share/vulkan/icd.d/wrapper_icd.aarch64.json
export WRAPPER_LOG_LEVEL=none
export WRAPPER_CMD_LOG_LEVEL=none
```
**It's done**

Now you can export your DISPLAY by using `export DISPLAY=:0` and use apps/packages using Hardware Acceleration.

For an example GLmark2, just run
```
glmark2
```
And it will use Zink for HWA.

You can also run `vkmark`, it should say you GPU name. If it shows, then your VK is also working.

If you use my `termux-xfce4` script to start the XFCE4 desktop environment then it will be hardware accelerated also

</details>

<br>

<details>
  <summary>Tap, for Adreno GPU HWA usage</summary>

### How to use HWA on Adreno
In order to utilise Turnip and Vulkan Wrapper Android, we have to run few commands.

Export `mesa` variables, its tunes and set the driver to Turnip:
```
export MESA_NO_ERROR=1
export MESA_NO_WAIT_FOR_VBLANK=1
export vblank_mode=0
export MESA_LOADER_DRIVER_OVERRIDE=zin
export ZINK_DESCRIPTORS=lazy
export LIBGL_DRI3_ENABLE=1
```
Export Vulkan Wrapper ICD path:
```
export VK_ICD_FILENAMES=/data/data/com.termux/files/usr/share/vulkan/icd.d/wrapper_icd.aarch64.json
export WRAPPER_LOG_LEVEL=none
export WRAPPER_CMD_LOG_LEVEL=none
```
**It's done**

Now you can export your DISPLAY by using `export DISPLAY=:0` and use apps/packages using Hardware Acceleration.

For an example GLmark2, just run
```
glmark2
```
And it will use Turnip for HWA.

You can also run `vkmark`, it should say you GPU name. If it shows, then your VK is also working.

If you use my `termux-xfce4` script to start the XFCE4 desktop environment then it will be hardware accelerated also

</details>

---
<br>

## PRoot Hardware Acceleration <a name=proot-hwa></a>
We can use Turnip inside PRoot for better performance, but it may not come. But still if you want, you can check out DroidMaster's repository by [Clicking here](https://github.com/LinuxDroidMaster/Termux-Desktops/blob/main/Documentation/HardwareAcceleration.md)

Since we don't need whole desktop running inside a PRoot distribution, we don't usually need HWA for it.
