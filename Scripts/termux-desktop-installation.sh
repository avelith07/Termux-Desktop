#!/data/data/com.termux/files/usr/bin/bash

# Color Definitions
BOLD_RED="\e[1;31m"
BOLD_YELLOW="\e[1;33m"
BOLD_CYAN="\e[1;36m"
BOLD_GREEN="\e[1;32m"
RESET="\e[0m"

# Initial Setup
echo -e "${BOLD_YELLOW}Wait a bit${RESET}"
pkg update > /dev/null 2>&1
pkg install -y termux-api > /dev/null 2>&1
termux-tts-speak "Thanks for using TCM's script! your installation will begin shortly" > /dev/null 2>&1
clear

echo -e "${BOLD_YELLOW}Setting up a few things...\nMay ask for user input!${RESET}"

pkg update > /dev/null 2>&1
pkg upgrade -y
termux-wake-lock
pkg install -y wget > /dev/null 2>&1

cd ~

wget -O termux-fastest-repo \
https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/termux-fastest-repo \
> /dev/null 2>&1

chmod +x termux-fastest-repo

termux-tts-speak "Please remember that it will ask for user to enter, just enter to the following questions" > /dev/null 2>&1
./termux-fastest-repo

echo -e "${BOLD_GREEN}Done Successfully...${RESET}"
sleep 2
clear

rm -rf ~/termux-fastest-repo

echo -e "${BOLD_YELLOW}Updating & Upgrading All Packages...\nThis will take a few moments.${RESET}"
pkg update
pkg upgrade -y

echo -e "${BOLD_GREEN}Done Successfully...${RESET}"
sleep 2
clear

# Install Essential Packages
echo -e "${BOLD_YELLOW}Installing Necessary Packages...\nUsually takes a few moments${RESET}"
pkg install -y x11-repo
pkg install -y termux-x11-nightly
pkg install -y tur-repo
pkg install -y termux-api
pkg install -y pulseaudio
pkg install -y proot-distro
pkg install -y rsync
pkg install -y python
echo -e "${BOLD_GREEN}Done Successfully...${RESET}"
sleep 2
clear

# Termux API Permissions
echo -e "${BOLD_YELLOW}Setting up Termux API Permissions...${RESET}"
clear
echo -e "${BOLD_RED}Give Microphone Permission to Termux API${RESET}"
sleep 1

termux-microphone-record -d 4
clear

termux-tts-speak "If you want other permissions visit official websites of Termux API" > /dev/null 2>&1
sleep 2
clear

# HWA Setup
echo -e "${BOLD_YELLOW}Installing & Configuring HWA...${RESET}"
termux-tts-speak "Reminder for user input" > /dev/null 2>&1

while true; do
  echo -e "${BOLD_CYAN}What GPU do you have?${RESET}"
  echo -e "${BOLD_YELLOW}1) Mali with Vulkan-supported (HWA Supported)${RESET}"
  echo -e "${BOLD_YELLOW}2) Adreno 6xx/7xx, except Adreno 710, 642L, 720 & 730 (HWA Supported)${RESET}"
  echo -e "${BOLD_YELLOW}3) Other Adreno GPUs (CPU-only)${RESET}"
  echo -e "${BOLD_YELLOW}4) Mali without Vulkan support or PowerVR (CPU-only)${RESET}"
  echo -e "${BOLD_YELLOW}5) CPU Rasterizer (Only if you don't meet above criteria)${RESET}"
  
  read -p "Enter your choice [1-4]: " choice

  case $choice in
    1)
      echo -e "${BOLD_YELLOW}Installing & Configuring HWA...${RESET}"
      pkg update > /dev/null 2>&1

      mkdir -p ~/Temp-HWA
      cd ~/Temp-HWA

      wget -O mesa-zink_23.0.4-5_aarch64.deb \
https://github.com/Prime-TITAN-CameraMan/Termux-Desktop/releases/download/v23.0.4-5/mesa-zink_23.0.4-5_aarch64.deb

      wget -O mesa-zink-dev_23.0.4-5_all.deb \
https://github.com/Prime-TITAN-CameraMan/Termux-Desktop/releases/download/v23.0.4-5/mesa-zink-dev_23.0.4-5_all.deb

      apt install -y ./*.deb
      apt install -y virglrenderer-mesa-zink vulkan-loader-generic angle-android virglrenderer-android \
libandroid-shmem libc++ libdrm libx11 libxcb libxshmfence libwayland zlib zstd

      wget -O vulkan-icd.deb \
https://github.com/Prime-TITAN-CameraMan/Termux-Desktop/releases/download/v25.0.0-2/vulkan-wrapper-android_25.0.0-2_aarch64.deb

      apt install -y ./vulkan-icd.deb
      apt --fix-broken install -y

      cd ~
      rm -rf ~/Temp-HWA

      pkg install -y glmark2
      pkg install -y vkmark

      mkdir -p ~/bin
      cd ~/bin

      wget -O termux-xfce4 \
https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/DE%20Startup%20Scripts/termux-xfce4-mali.sh

      chmod +x termux-xfce4
      cd ~

      break
      ;;
    2)
      echo -e "${BOLD_YELLOW}Installing & Configuring HWA...${RESET}"

      mkdir -p ~/Temp-HWA
      cd ~/Temp-HWA
     
      apt install -y mesa-zink mesa-zink-dev virglrenderer-mesa-zink vulkan-loader-generic angle-android virglrenderer-android \
libandroid-shmem libc++ libdrm libx11 libxcb libxshmfence libwayland zlib zstd
      apt install mesa-vulkan-icd-freedreno-dri3
      apt --fix-broken install -y

      wget -O vulkan-icd.deb \
https://github.com/Prime-TITAN-CameraMan/Termux-Desktop/releases/download/v25.0.0-2/vulkan-wrapper-android_25.0.0-2_aarch64.deb

      apt install -y ./vulkan-icd.deb
      apt --fix-broken install -y

      cd ~
      rm -rf ~/Temp-HWA

      pkg install -y glmark2
      pkg install -y vkmark

      mkdir -p ~/bin
      cd ~/bin

      wget -O termux-xfce4 \
https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/DE%20Startup%20Scripts/termux-xfce4-adreno.sh

      chmod +x termux-xfce4
      cd ~

      break
      ;;
    3)
      echo -e "${BOLD_YELLOW}Skipping HWA...${RESET}"

      mkdir -p ~/bin
      cd ~/bin

      wget -O termux-xfce4 \
https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/DE%20Startup%20Scripts/termux-xfce4-cpu.sh
            
      break
      ;;
    4)
      echo -e "${BOLD_YELLOW}Skipping HWA...${RESET}"

      mkdir -p ~/bin
      cd ~/bin

      wget -O termux-xfce4 \
https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/DE%20Startup%20Scripts/termux-xfce4-cpu.sh
      
      break
      ;;
    5)
      echo -e "${BOLD_YELLOW}Skipping HWA...${RESET}"

      mkdir -p ~/bin
      cd ~/bin

      wget -O termux-xfce4 \
https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/DE%20Startup%20Scripts/termux-xfce4-cpu.sh

      break
      ;;
    *)
      echo -e "{BLOD_RED}Invalid option, please try again!"
      sleep 1
      ;;
  esac
done

echo -e "${BOLD_GREEN}Done...${RESET}"
sleep 2
clear

# Browser Installation
echo -e "${BOLD_YELLOW}Browser Installation...\nUsually takes a few minutes${RESET}"

termux-tts-speak "Reminder for user input" > /dev/null 2>&1

while true; do
  echo -e "${BOLD_CYAN}Select Your Browser:${RESET}"
  echo -e "${BOLD_YELLOW}1) Firefox (recommended)${RESET}"
  echo -e "${BOLD_YELLOW}2) Chromium (not recommended)${RESET}"
  echo -e "${BOLD_YELLOW}3) Firefox and Chromium (both)${RESET}"

  read -p "Enter your choice [1-3]: " choice

  case $choice in
    1)
      echo -e "${BOLD_YELLOW}Installing Firefox...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y firefox
      echo -e "${BOLD_GREEN}Firefox Installed Successfully!${RESET}"
      break
      ;;
    2)
      echo -e "${BOLD_YELLOW}Installing Chromium...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y chromium
      echo -e "${BOLD_GREEN}Chromium Installed Successfully!${RESET}"
      break
      ;;
    3)
      echo -e "${BOLD_YELLOW}Installing Firefox and Chromium...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y firefox
      pkg install -y chromium
      echo -e "${BOLD_GREEN}Firefox and Chromium Installed Successfully!${RESET}"
      break
      ;;
    *)
      echo -e "${BOLD_RED}Invalid option. Please try again.${RESET}"
      ;;
  esac
done

echo -e "${BOLD_GREEN}Browser Installed Successfully...${RESET}"
sleep 2
clear

# Video Player Installation
echo -e "${BOLD_YELLOW}Installing a Video Player (works for audio as well)...\nUsually takes a few minutes depending on speed${RESET}"
termux-tts-speak "Reminder for user input" > /dev/null 2>&1

while true; do
  echo -e "${BOLD_CYAN}Select Your Player:${RESET}"
  echo -e "${BOLD_YELLOW}1) VLC (recommended, slightly higher storage use)${RESET}"
  echo -e "${BOLD_YELLOW}2) MPV (recommended, storage friendly)${RESET}"
  echo -e "${BOLD_YELLOW}3) VLC & MPV (both)${RESET}"
  echo -e "${BOLD_YELLOW}4) Skip${RESET}"

  read -p "Enter your choice [1-4]: " choice

  case $choice in
    1)
      echo -e "${BOLD_YELLOW}Installing VLC...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y vlc-qt
      echo -e "${BOLD_GREEN}VLC Installed Successfully!${RESET}"
      break
      ;;
    2)
      echo -e "${BOLD_YELLOW}Installing MPV...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y mpv
      echo -e "${BOLD_GREEN}MPV Installed Successfully!${RESET}"
      break
      ;;
    3)
      echo -e "${BOLD_YELLOW}Installing VLC and MPV (both)...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y mpv
      pkg install -y vlc-qt
      echo -e "${BOLD_GREEN}VLC and MPV Installed Successfully!${RESET}"
      break
      ;;
    4)
      echo -e "${BOLD_YELLOW}Skipping Installation${RESET}"
      break
      ;;
    *)
      echo -e "${BOLD_RED}Invalid option. Please try again.${RESET}"
      ;;
  esac
done

echo -e "${BOLD_GREEN}Done Successfully...${RESET}"
sleep 2
clear

# IDE Installation
echo -e "${BOLD_YELLOW}Installing an IDE...\nUsually takes a while${RESET}"
termux-tts-speak "Reminder for user input" > /dev/null 2>&1

while true; do
  echo -e "${BOLD_CYAN}Select Your IDE:${RESET}"
  echo -e "${BOLD_YELLOW}1) VS Code (code-oss)${RESET}"
  echo -e "${BOLD_YELLOW}2) Geany${RESET}"
  echo -e "${BOLD_YELLOW}3) VS Code & Geany (both)${RESET}"
  echo -e "${BOLD_YELLOW}4) Skip${RESET}"

  read -p "Enter your choice [1-4]: " choice

  case $choice in
    1)
      echo -e "${BOLD_YELLOW}Installing VS Code...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y code-oss
      echo -e "${BOLD_GREEN}VS Code Installed Successfully!${RESET}"
      break
      ;;
    2)
      echo -e "${BOLD_YELLOW}Installing Geany...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y geany
      echo -e "${BOLD_GREEN}Geany Installed Successfully!${RESET}"
      break
      ;;
    3)
      echo -e "${BOLD_YELLOW}Installing VS Code and Geany (both)...${RESET}"
      pkg update > /dev/null 2>&1
      pkg install -y code-oss
      pkg install -y geany
      echo -e "${BOLD_GREEN}VS Code and Geany Installed Successfully!${RESET}"
      break
      ;;
    4)
      echo -e "${BOLD_YELLOW}Skipping Installation${RESET}"
      break
      ;;
    *)
      echo -e "${BOLD_RED}Invalid option. Please try again.${RESET}"
      ;;
  esac
done

echo -e "${BOLD_GREEN}Done Successfully...${RESET}"
sleep 2
clear

# XFCE4 Installation
echo -e "${BOLD_YELLOW}Installing XFCE4 and some utilities...\nThis will take a while${RESET}"

pkg install -y xfce4
pkg install -y xfce4-goodies
pkg install -y xfce4-whiskermenu-plugin
pkg install -y xfce4-battery-plugin
pkg install -y xfce4-cpugraph-plugin
pkg install -y xfce4-docklike-plugin
pkg install -y xfce4-genmon-plugin
pkg install -y xfce4-places-plugin
pkg install -y xfce4-pulseaudio-plugin
pkg install -y xfce4-screenshooter
pkg install -y xfce4-taskmanager
pkg install -y fastfetch
pkg install -y mousepad
pkg install -y cava

echo -e "${BOLD_GREEN}Done Successfully...${RESET}"
sleep 2
clear

# Pre-configured XFCE4 Setup
echo -e "${BOLD_YELLOW}TCM's pre-configured XFCE4 style${RESET}"
termux-tts-speak "Reminder for user input" > /dev/null 2>&1

while true; do
  echo -e "${BOLD_CYAN}Do you want to install TCM’s preconfigured XFCE4 setup?\nThis process usually takes a few moments.${RESET}"
  echo -e "${BOLD_YELLOW}1) Yes (Not recommended unless you are new to Linux)${RESET}"
  echo -e "${BOLD_YELLOW}2) No (Recommended; use the default XFCE4 configuration)${RESET}"

  read -p "Enter your choice [1-2]: " choice

  case $choice in
    1)
      echo -e "${BOLD_YELLOW}Setting up TCM’s configuration...${RESET}"

      cd ~
      mkdir -p Dirs-TCM
      cd ~/Dirs-TCM

      wget -O Setup.tar.gz \
https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/main/Configurations/Termux-XFCE4-config.tar.gz

      tar -xvzf Setup.tar.gz

      rsync -avh ~/Dirs-TCM/Configuration/ ~/

      cd ~
      rm -rf ~/Dirs-TCM

      echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"

      break
      ;;
    2)
      echo -e "${BOLD_YELLOW}Skipping. Continuing with default XFCE4 configuration...${RESET}"

      cd ~
      mkdir -p ~/Desktop ~/Downloads ~/Pictures ~/Temp

      echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"

      break
      ;;
    *)
      echo -e "${BOLD_RED}Invalid option. Please try again.${RESET}"
      ;;
  esac
done

echo -e "${BOLD_GREEN}Completed.${RESET}"
sleep 2
clear

# User-friendly Scripts Installation
echo -e "${BOLD_YELLOW}Setting up user-friendly helper scripts${RESET}"

mkdir -p ~/bin
cd ~/bin

wget -O apphwa https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/apphwa
wget -O native_cleaner https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/native_cleaner
wget -O proot_program https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/proot_program
wget -O termux-fastest-repo https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/termux-fastest-repo
wget -O desktop-help https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/desktop-help
wget -O termux-multi-instance https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/termux-multi-instance
wget -O extract https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/extract

chmod +x apphwa
chmod +x native_cleaner
chmod +x proot_program
chmod +x termux-multi-instance
chmod +x termux-fastest-repo
chmod +x desktop-help
chmod +x extract

cd ~

echo -e "${BOLD_GREEN}Done Successfully...${RESET}"
sleep 2
clear

# Debian PRoot Installation
echo -e "${BOLD_YELLOW}Installing Debian PRoot Distribution...\nThis usually takes a few moments (40MB file)${RESET}"

proot-distro install debian

echo -e "${BOLD_GREEN}Done Successfully...${RESET}"
sleep 2
clear

echo -e "${BOLD_YELLOW}Setting up Debian...\nThis may take a while if the server is slow${RESET}"

proot-distro login debian --shared-tmp -- /bin/bash << 'EOF'
apt update
apt upgrade -y
apt install -y sudo
apt install -y nano
apt install -y dbus-x11
apt install -y adduser
apt install -y pulseaudio
mkdir "$HOME/bin"
EOF

echo -e "${BOLD_GREEN}Done Successfully...${RESET}"
sleep 2
clear

# Communication Apps
echo -e "${BOLD_YELLOW}Installing Communication Apps...\nUsually takes a while depending on connection speed${RESET}"
termux-tts-speak "Reminder for user input" > /dev/null 2>&1

while true; do
  echo -e "${BOLD_CYAN}Select Your App:${RESET}"
  echo -e "${BOLD_YELLOW}1) Discord (Vencord)${RESET}"
  echo -e "${BOLD_YELLOW}2) Telegram${RESET}"
  echo -e "${BOLD_YELLOW}3) Discord & Telegram (both)${RESET}"
  echo -e "${BOLD_YELLOW}4) Skip${RESET}"

  read -p "Enter your choice [1-4]: " choice

  case $choice in
    1)
      echo -e "${BOLD_YELLOW}Installing Discord...${RESET}"

proot-distro login debian --shared-tmp -- /bin/bash << 'EOF'
apt update
apt install -y wget
wget -O vesktop_1.6.3_arm64.deb https://github.com/Vencord/Vesktop/releases/download/v1.6.3/vesktop_1.6.3_arm64.deb
apt install -y ./vesktop_1.6.3_arm64.deb
apt --fix-broken install -y
rm -rf vesktop_1.6.3_arm64.deb
EOF

      echo -e "${BOLD_GREEN}Discord Installed Successfully!${RESET}"
      break
      ;;
    2)
      echo -e "${BOLD_YELLOW}Installing Telegram...${RESET}"

      pkg update > /dev/null 2>&1
      pkg install -y telegram-desktop

      echo -e "${BOLD_GREEN}Telegram Installed Successfully!${RESET}"
      break
      ;;
    3)
      echo -e "${BOLD_YELLOW}Installing Discord and Telegram...${RESET}"

proot-distro login debian --shared-tmp -- /bin/bash << 'EOF'
apt update
apt install -y wget
wget -O vesktop_1.6.3_arm64.deb https://github.com/Vencord/Vesktop/releases/download/v1.6.3/vesktop_1.6.3_arm64.deb
apt install -y ./vesktop_1.6.3_arm64.deb
apt --fix-broken install -y
rm -rf vesktop_1.6.3_arm64.deb
EOF

      pkg update > /dev/null 2>&1
      pkg install -y telegram-desktop

      echo -e "${BOLD_GREEN}Discord and Telegram Installed Successfully!${RESET}"
      break
      ;;
    4)
      echo -e "${BOLD_YELLOW}Skipping Installation${RESET}"
      break
      ;;
    *)
      echo -e "${BOLD_RED}Invalid option. Please try again.${RESET}"
      ;;
  esac
done

echo -e "${BOLD_GREEN}Done Successfully...${RESET}"
sleep 2
clear

# Ending Section
termux-tts-speak "Last step" > /dev/null 2>&1
while true; do
  echo -e "${BOLD_CYAN}Do you want to join TCM's Discord server?${RESET}"
  echo -e "${BOLD_YELLOW}1) Yes${RESET}"
  echo -e "${BOLD_YELLOW}2) No${RESET}"

  read -p "Enter your choice [1-2]: " choice

  case "$choice" in
    1)
      termux-tts-speak "Thanks for joining the server"
      sleep 1
      termux-open "https://discord.gg/xCMJwG5gGK"
      break
      ;;
    2)
      echo "Skipping..."
      break
      ;;
    *)
      echo -e "${BOLD_YELLOW}Invalid option. Please enter 1 or 2.${RESET}"
      ;;
  esac
done

echo -e "${BOLD_CYAN}Congratulations, it's done. Now kill & restart your Termux.${RESET}"
echo -e "${BOLD_CYAN}Run \"desktop-help\" to know all necessary commands to operate the desktop.${RESET}"

termux-toast "Everything has been completed"
termux-toast "Kill and restart your Termux to apply changes!"

exit 0
