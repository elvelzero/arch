#!/bin/bash
#
## My arch install
#

echo "=====:=====:=====     Install aura-bin     =====:=====:====="
cd downloads/clone/
git clone https://aur.archlinux.org/aura-bin.git
cd aura-bin/
makepkg -sic
cd

echo "=====:=====:===== Display Server & Driver  =====:=====:====="
sudo pacman -S --needed xorg-{server,xinit,xrandr,xbacklight,xprop,xsetroot,mkfontdir} xclip xf86-{input-libinput,video-intel} nvidia{,-utils}

echo "=====:=====:=====       Install fonts       =====:=====:====="
sudo pacman -S --needed adobe-source-code-pro-fonts ttf-{cascadia-code,fira-code,jetbrains-mono}
sudo aura -Ax ttf-mononoki
sudo aura -Ax nerd-fonts-mononoki
sudo pacman -S --needed ttf-{baekmuk,hanazono} otf-ipafont adobe-source-han-{sans-{kr,jp},serif-{kr,jp}}-fonts

sudo fc-cache -fv

echo "=====:=====:=====      Install vim-git      =====:=====:====="
cd downloads/clone/
git clone https://aur.archlinux.org/vim-git.git
cd vim-git/
sed -i '46s/disable/enable/' PKGBUILD
# sudo pacman -Rns vim
# makepkg -sic
