#!/bin/bash
#
## My arch install
#

echo "=====:=====:===== Installing My Core Packages Part 1 =====:=====:====="
sudo pacman -S --needed polkit lxsession xorg-{server,xinit,xrandr,xbacklight,xprop,xsetroot,mkfontdir} xclip xf86-{input-libinput,video-intel} nvidia{,-utils} adobe-source-code-pro-fonts ttf-{cascadia-code,fira-code,jetbrains-mono} && sudo aura -Ax ttf-mononoki && sudo aura -Ax nerd-fonts-mononoki && sudo pacman -S --needed ttf-{baekmuk,hanazono} otf-ipafont adobe-source-han-{sans-{kr,jp},serif-{kr,jp}}-fonts

sudo fc-cache -fv

echo "=====:=====:===== Installing My Core Packages Part 2 =====:=====:====="
sudo pacman -S --needed xmonad{,-contrib} xmobar python-pillow kitty{,-terminfo} && sudo aura -Ax google-chrome && sudo aura -Ax spacefm && sudo pacman -S --needed ranger trash-cli nitrogen picom rofi scrot yt-dlp && sudo aura -Ax i3lock-color && sudo pacman -S --needed lxappearance qt5ct arc-gtk-theme kvantum-qt5 papirus-icon-theme
sudo pacman -Rns perl-libwww
sudo pacman -S --asdeps perl-{libwww,image-exiftool}
