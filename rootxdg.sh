#!/bin/bash
#
## My arch install
#

echo "=====:=====:=====     Make XDG Base Dirs & Move Some Items     =====:=====:====="
mkdir -p ~/{.cache/{xmonad,thumbnails/{fail,large,normal,x-large,xx-large}},.config/{android,bash,java,nvim,vim,xmonad,xmobar,zsh},.local/{share/xmonad,state/bash}}
mv .bash* .config/bash/
mv .config/bash/.bash_logout .config/bash/bash_logout
mv .config/bash/.bash_profile .config/bash/bash_profile
mv .config/bash/.bashrc .config/bash/bashrc
touch .config/nvim/init.vim

echo "=====:=====:=====            Copying my config file            =====:=====:====="
cp -r /home/urUserName/my/downloads/clone/config/.config/{bash,i3lock-color,kitty,npm,picom,rofi,vim,wgetrc,X11,xmobar,xmonad,zathura} .config/
echo "=====:=====:===== Don't Forget to Source bashrc & bash_profile =====:=====:====="
echo "=====:=====:=====                 or Relogin                   =====:=====:====="
