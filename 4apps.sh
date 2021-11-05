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

echo "=====:=====:=====           Rebuilding Vim           =====:=====:====="
cd my/downloads/clone/vim-git/
sed -i '46s/disable/enable/' PKGBUILD
sudo pacman -Rns vim
makepkg -si

echo "=====:=====:===== Installing My Apps Part 1 =====:=====:====="
sudo pacman -S --needed imagemagick sxiv mpv celluloid ffmpeg tar unzip zip && sudo aura -Ax rar && sudo pacman -S --needed file-roller udisks2 udevil ntfs-3g gvfs{,-mtp} libmtp mtpfs && sudo aura -Ax jmtpfs && sudo pacman -S --needed libreoffice-fresh zathura{,-cb,-djvu,-pdf-mupdf,-ps} gimp inkscape obs-studio && sudo aura -Ax olive

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

#"=====:=====:=====           Install ur IDE           =====:=====:====="
# sudo aura -Ax visual-studio-code-bin
# Kotlin with vscode: https://www.petanikode.com/kotlin-vscode/
# sudo aura -Ax intellij-idea-ce
# sudo pacman -S netbeans
# sudo aura -Ax android-studio
