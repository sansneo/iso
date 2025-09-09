#!/bin/sh
clean() { printf "%s" "$1" | tr '\n' ' ' | sed 's/  */ /g'; }

# Drivers
drivers="
efibootmgr
exfat-utils
linux-firmware
linux-headers
ntfs-3g
os-prober
"
drivers=$(clean "$drivers")

# Services
services="
cronie
dbus
elogind
tlp
tlp-rdw
"
services=$(clean "$services")

# Utilities
utilities="
7zip
atool
ctags
curl
dpkg
fd
ffmpeg
git
git-lfs
github-cli
jq
magic-wormhole
mg
openssl
q
rclone
ripgrep
rsync
tmux
unrar
wget
xxd
"
utilities=$(clean "$utilities")

# Cloud
cloud="
docker
docker-buildx
docker-compose
"
cloud=$(clean "$cloud")

# Dev
dev="
base-devel
cmake
gdb
ltrace
rizin
rz-ghidra
sqlite
strace
typst
upx
"
dev=$(clean "$dev")

# Fonts
fonts="
noto-fonts-cjk
noto-fonts-emoji
noto-fonts-ttf
noto-fonts-ttf-variable
"
fonts=$(clean "$fonts")

# Xorg
xorg="
gstreamer-vaapi
gstreamer1
libva-utils
mesa-dri
mesa-vaapi
mesa-vdpau
setxkbmap
vulkan-loader
xclip
xdg-user-dirs
xf86-video-dummy
xf86-video-fbdev
xinput
xorg-input-drivers
xorg-minimal
xprop
xrandr
xset
"
xorg=$(clean "$xorg")

# Audio
audio="
alsa-firmware
sof-firmware
pulseaudio
"
audio=$(clean "$audio")

# Bluetooth
bluetooth="
broadcom-bt-firmware
bluez
"
bluetooth=$(clean "$bluetooth")

# Are you root?
if [ "$(id -u)" -ne 0 ]; then echo "Run as root!"; exit 1; fi

# Going into void-mklive
cd void-mklive/

# Minimal
./mkiso.sh -a x86_64 -b base-system \
    -r "https://repo-fastly.voidlinux.org/current" \
    -r "https://repo-fastly.voidlinux.org/current/nonfree" \
    -r "https://repo-fastly.voidlinux.org/current/multilib" \
    -- -k "us" -T "Void Linux" -o ../builds/minimal.iso \
    -p "void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree" \
    -p "$drivers $services $utilities $cloud $dev noto-fonts-ttf" \
    -e /bin/bash \
    -I ../custom \
    -S "dhcpcd tlp dbus elogind sshd" \
    -C "vconsole.keymap=us" 

# Xorg
./mkiso.sh -a x86_64 -b base-system \
    -r "https://repo-fastly.voidlinux.org/current" \
    -r "https://repo-fastly.voidlinux.org/current/nonfree" \
    -r "https://repo-fastly.voidlinux.org/current/multilib" \
    -- -k "us" -T "Void Linux" -o ../builds/xorg.iso \
    -p "void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree" \
    -p "$drivers $services $utilities $cloud $dev $fonts" \
    -e /bin/bash \
    -I ../custom \
    -S "dhcpcd tlp dbus elogind" \
    -C "vconsole.keymap=us" 


# Done!
cd ..
