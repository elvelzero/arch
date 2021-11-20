#!/bin/bash
#
## My arch install
#

echo "=====:=====:=====                 Enabling ufw                 =====:=====:====="
sudo ufw enable
sudo ufw status verbose

echo "=====:=====:=====     Make XDG Base Dirs & Move Some Items     =====:=====:====="
mkdir -p ~/{.cache/{xmonad,X11,thumbnails/{fail,large,normal,x-large,xx-large},bundle,nv,pylint,python-eggs,vim},.config/{android,bash,bundle,cabal,ffmpeg,gdb,gtk-1.0,gtk-2.0,grip,java,jupyter,nvidia,npm,nvim,pg,vim/after,X11,xmonad,xmobar,sqlite3,zsh},.local/{share/{xmonad,android,azure,bundle,cabal,cargo,gdb,gnupg,go,gradle,rustup,vim,zoom},state/{bash,vim}}}
mv .bash* .config/bash/
mv .config/bash/.bash_logout .config/bash/bash_logout
mv .config/bash/.bash_profile .config/bash/bash_profile
mv .config/bash/.bashrc .config/bash/bashrc

# sudo cp arch/Xsession /etc/X11/

echo "=====:=====:=====    Update XDG User Dirs & Clone My Config    =====:=====:====="
xdg-user-dirs-update
mkdir downloads/clone
cd downloads/clone
git clone https://github.com/iNeobee/config
cd
echo "=====:=====:=====             Copying my Wallpaper             =====:=====:====="
sudo mkdir -p /usr/share/backgrounds/my-wallpaper/
sudo cp my/downloads/clone/config/pictures/*.jpg /usr/share/backgrounds/my-wallpaper/
echo "=====:=====:=====            Copying my config file            =====:=====:====="
# cp -r my/downloads/clone/config/.config/{bash,conky,i3lock-color,kitty,npm,picom,ranger,rofi,nvim,vim,wgetrc,X11,xmobar,xmonad,zathura} .config/
rsync -r my/downloads/clone/config/.config/{bash,conky,i3lock-color,kitty,npm,picom,ranger,rofi,nvim,vim,wgetrc,X11,xmobar,xmonad,zathura} .config/
sudo cp my/downloads/clone/config/etc/profile.d/* /etc/profile.d/
echo "=====:=====:===== Don't Forget to Source bashrc & bash_profile =====:=====:====="
echo "=====:=====:=====                 or Relogin                   =====:=====:====="
