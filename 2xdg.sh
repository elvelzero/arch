#!/bin/bash

sudo ufw enable
sudo ufw status verbose

mkdir -p ~/{.cache/{xmonad,thumbnails/{fail,large,normal,x-large,xx-large}},.config/{android,bash,java,xmonad,xmobar,zsh},.local/{share/xmonad,state/bash}}
mv .bash* .config/bash/
mv .config/bash/.bash_logout .config/bash/bash_logout
mv .config/bash/.bash_profile .config/bash/bash_profile
mv .config/bash/.bashrc .config/bash/bashrc

xdg-user-dirs-update
mkdir my/downloads/clone
cd my/downloads/clone
git clone https://github.com/iNeobee/config
cd
cp -r my/downloads/clone/config/.config/{bash,i3lock-color,kitty,npm,picom,rofi,vim,wgetrc,X11,,xmobar,xmonad,zathura} .config/
sudo cp my/downloads/clone/config/etc/profile.d/* /etc/profile.d/
# in artix linux copy /etc/profile.d/rc.sh /etc/bash/bashrc.d/second.bashrc
echo "edit /etc/bash.bashrc urself as root before installing ur apps"
echo "then relogin"
