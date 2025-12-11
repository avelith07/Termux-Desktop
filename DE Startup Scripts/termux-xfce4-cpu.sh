#!/data/data/com.termux/files/usr/bin/bash

# Kill X11 & Pulseaudio before starting
kill -9 $(pgrep -f "termux.x11") 
kill -9 $(pgrep -f "pulseaudio") 

# Start PulseAudio over Network
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

# Start microphone input (SLES)
pactl load-module module-sles-source 

export DISPLAY=:0
export PULSE_SERVER=127.0.0.1
export XDG_RUNTIME_DIR=${TMPDIR}

# Start Termux X11 
termux-x11 :0 >/dev/null 2>&1 &
sleep 4

# Launch Termux X11 MainActivity
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity >/dev/null 2>&1
sleep 2

# Start XFCE4 Desktop with DBus Session
dbus-launch --exit-with-session xfce4-session &

# Disable XFWM4 vblank
xfconf-query -c xfwm4 -p /general/vblank_mode -s "off" &

exit 0
