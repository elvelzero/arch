#!/bin/bash
#
## My arch install
#

echo "=====:=====:=====     Make XDG Base Dirs & Move Some Items     =====:=====:====="
mkdir -p ~/{.cache/{xmonad,X11,thumbnails/{fail,large,normal,x-large,xx-large},bundle,nv,pylint,python-eggs,vim},.config/{android,bash,bundle,cabal,ffmpeg,gdb,gtk-1.0,gtk-2.0,grip,java,jupyter,nvidia,npm,nvim,pg,vim/after,X11,xmonad,xmobar,sqlite3,zsh},.local/{share/{xmonad,android,azure,bundle,cabal,cargo,gdb,gnupg,go,gradle,rustup,vim,zoom},state/{bash,vim}}}
mv .bash* .config/bash/
mv .config/bash/.bash_logout .config/bash/bash_logout
mv .config/bash/.bash_profile .config/bash/bash_profile
mv .config/bash/.bashrc .config/bash/bashrc

echo "=====:=====:=====            Copying my config file            =====:=====:====="
cp -r /home/urUserName/my/downloads/clone/config/.config/{bash,i3lock-color,kitty,npm,picom,ranger,rofi,nvim,vim,wgetrc,X11,xmobar,xmonad,zathura} .config/
echo "=====:=====:===== Don't Forget to Source bashrc & bash_profile =====:=====:====="
echo "=====:=====:=====                 or Relogin                   =====:=====:====="
