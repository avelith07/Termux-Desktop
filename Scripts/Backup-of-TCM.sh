#!/data/data/com.termux/files/usr/bin/bash
pkg update
pkg upgrade -y
pkg install -y wget

wget -O termux-fastest-repo \
https://raw.githubusercontent.com/Prime-TITAN-CameraMan/Termux-Desktop/refs/heads/main/bin/termux-fastest-repo 
chmod +x termux-fastest-repo
./termux-fastest-repo
rm -rf ~/termux-fastest-repo

pkg install -y x11-repo
pkg install -y termux-x11-nightly
pkg install -y tur-repo
pkg install -y termux-api
pkg install -y pulseaudio
pkg install -y proot-distro
pkg install -y rsync
pkg install -y micro

termux-microphone-record -d 4

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
apt --fix-broken install -y

wget -O vulkan-icd.deb \
https://github.com/Prime-TITAN-CameraMan/Termux-Desktop/releases/download/v25.0.0-2/vulkan-wrapper-android_25.0.0-2_aarch64.deb

apt install -y ./vulkan-icd.deb
apt --fix-broken install -y

cd ~
rm -rf ~/Temp-HWA

pkg install -y glmark2
pkg install -y vkmark

pkg install -y firefox
pkg install -y mpv
pkg install -y xfce4
pkg install -y xfce4-goodies
pkg install -y xfce4-battery-plugin
pkg install -y xfce4-cpugraph-plugin
pkg install -y xfce4-docklike-plugin
pkg install -y xfce4-genmon-plugin
pkg install -y xfce4-places-plugin
pkg install -y xfce4-pulseaudio-plugin
pkg install -y xfce4-screenshooter
pkg install -y cava
pkg install -y mousepad

proot-distro install debian

proot-distro login debian --shared-tmp -- /bin/bash << 'EOF'
apt update
apt upgrade -y
apt install -y sudo nano adduser dbus-x11 pulseaudio 

apt install -y wget
wget -O vesktop_1.6.1_arm64.deb https://github.com/Vencord/Vesktop/releases/download/v1.6.1/vesktop_1.6.1_arm64.deb
apt install -y ./vesktop_1.6.1_arm64.deb
apt --fix-broken install -y
rm -rf vesktop_1.6.1_arm64.deb
EOF

echo "Done"
