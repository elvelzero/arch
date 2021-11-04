#!/bin/bash
#
## My arch install
#

echo "=====:=====:=====                 Enabling ufw                 =====:=====:====="
sudo ufw enable
sudo ufw status verbose

echo "=====:=====:=====     Make XDG Base Dirs & Move Some Items     =====:=====:====="
mkdir -p ~/{.cache/{xmonad,thumbnails/{fail,large,normal,x-large,xx-large}},.config/{android,bash,java,nvim,xmonad,xmobar,zsh},.local/{share/xmonad,state/bash}}
mv .bash* .config/bash/
mv .config/bash/.bash_logout .config/bash/bash_logout
mv .config/bash/.bash_profile .config/bash/bash_profile
mv .config/bash/.bashrc .config/bash/bashrc
touch .config/nvim/init.vim

echo "=====:=====:=====    Update XDG User Dirs & Clone My Config    =====:=====:====="
xdg-user-dirs-update
mkdir my/downloads/clone
cd my/downloads/clone
git clone https://github.com/iNeobee/config
cd
echo "=====:=====:=====             Copying my Wallpaper             =====:=====:====="
sudo mkdir -p /usr/share/backgrounds/my-wallpaper/
cp my/downloads/clone/config/*.jpg /usr/share/backgrounds/my-wallpaper/
echo "=====:=====:=====            Copying my config file            =====:=====:====="
cp -r my/downloads/clone/config/.config/{bash,i3lock-color,kitty,npm,picom,ranger,rofi,wgetrc,X11,xmobar,xmonad,zathura} .config/
sudo cp my/downloads/clone/config/etc/profile.d/* /etc/profile.d/
echo "=====:=====:===== Don't Forget to Source bashrc & bash_profile =====:=====:====="
echo "=====:=====:=====                 or Relogin                   =====:=====:====="
