#!/bin/bash
#
## My arch install
#

echo "=====:=====:=====     Cloning aura-bin & vim-git     =====:=====:====="
cd my/downloads/clone/
git clone https://aur.archlinux.org/aura-bin.git
git clone https://aur.archlinux.org/vim-git.git
cd aura-bin
makepkg -si
cd

echo "=====:=====:===== Installing My Core Packages Part 1 =====:=====:====="
sudo pacman -S --needed polkit lxsession xorg-{server,xinit,xrandr,xbacklight,xprop,xsetroot,mkfontdir} xclip xf86-{input-libinput,video-intel} nvidia{,-utils} adobe-source-code-pro-fonts ttf-{cascadia-code,fira-code,jetbrains-mono} && sudo aura -Ax ttf-mononoki && sudo aura -Ax nerd-fonts-mononoki && sudo pacman -S --needed ttf-{baekmuk,hanazono} otf-ipafont adobe-source-han-{sans-{kr,jp},serif-{kr,jp}}-fonts && sudo pacman -S --needed rsync lsof cmake jre{8,11,}-openjdk{,-headless} jdk{8,11,}-openjdk kotlin gradle nodejs npm ghc cabal-install stack go lua mono ruby{,-irb} rustup

sudo fc-cache -fv

echo "=====:=====:===== Installing My Core Packages Part 2 =====:=====:====="
sudo pacman -S --needed xmonad{,-contrib} xmobar python-pillow kitty{,-terminfo} && sudo aura -Ax google-chrome && sudo aura -Ax spacefm && sudo pacman -S --needed ranger trash-cli nitrogen picom rofi scrot yt-dlp && sudo aura -Ax i3lock-color && sudo pacman -S --asdeps perl-{libwww,image-exiftool} && sudo pacman -S --needed lxappearance qt5ct arc-gtk-theme kvantum-qt5 papirus-icon-theme imagemagick sxiv mpv celluloid ffmpeg tar unzip zip && sudo aura -Ax rar && sudo pacman -S --needed file-roller udisks2 udevil ntfs-3g gvfs{,-mtp} libmtp mtpfs && sudo aura -Ax jmtpfs && sudo pacman -S --needed libreoffice-fresh gimp inkscape obs-studio && sudo aura -Ax olive && sudo pacman -S --needed zathura{,-cb,-djvu,-pdf-mupdf,-ps}

echo "=====:=====:=====           Installing Tex           =====:=====:====="
sudo pacman -S  texlive{-most,-lang,-bibtexextra}

echo "=====:=====:=====       Installing Virtual Box       =====:=====:====="
sudo pacman -S virtualbox
sudo modprobe vboxdrv
sudo usermod -aG vboxusers urUserName
sudo pacman -S virtualbox-guest-{iso,utils}

echo "=====:=====:=====           Install Clamav           =====:=====:====="
sudo pacman -S clamav
echo "=====:=====:=====         Updating database          =====:=====:====="
sudo freshclam
#=====:=====:===== Im not going to enable clamav-freshclam.service & clamav-daemon.service =====:=====:=====

echo "=====:=====:=====           Install ur IDE           =====:=====:====="
# sudo aura -Ax visual-studio-code-bin
# Kotlin with vscode: https://www.petanikode.com/kotlin-vscode/
# sudo aura -Ax intellij-idea-ce
# sudo pacman -S netbeans
# sudo aura -Ax android-studio
