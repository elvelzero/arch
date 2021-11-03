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

echo "=====:=====:=====       Installing youtube-dl        =====:=====:====="
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

echo "=====:=====:=====       Installing unimatrix         =====:=====:====="
sudo curl -L https://raw.githubusercontent.com/will8211/unimatrix/master/unimatrix.py -o /usr/local/bin/unimatrix
sudo chmod a+rx /usr/local/bin/unimatrix

echo "=====:=====:=====       Installing Vim Plugins       =====:=====:====="
git clone https://github.com/lilydjwg/colorizer .config/vim/pack/plugins/start/colorizer/
git clone https://github.com/vim-airline/vim-airline .config/vim/pack/plugins/start/vim-airline/
git clone https://github.com/vim-airline/vim-airline-themes .config/vim/pack/plugins/start/vim-airline-themes/
git clone https://github.com/vim-syntastic/syntastic .config/vim/pack/plugins/start/syntastic/
git clone https://github.com/jiangmiao/auto-pairs .config/vim/pack/plugins/start/auto-pairs/
git clone https://github.com/alvan/vim-closetag .config/vim/pack/plugins/start/vim-closetag/
git clone https://github.com/tpope/vim-commentary .config/vim/pack/plugins/start/vim-commentary/
git clone https://github.com/tpope/vim-surround .config/vim/pack/plugins/start/vim-surround/
git clone https://github.com/honza/vim-snippets .config/vim/pack/plugins/start/vim-snippets/
git clone https://github.com/SirVer/ultisnips .config/vim/pack/plugins/start/ultisnips/
git clone https://github.com/lervag/vimtex .config/vim/pack/plugins/start/vimtex/
git clone https://github.com/mg979/vim-visual-multi .config/vim/pack/plugins/start/vim-visual-multi/

echo "=====:=====:=====  Installing Vim Nord Color Scheme  =====:=====:====="
git clone https://github.com/arcticicestudio/nord-vim my/downloads/clone/nord-vim/
cp -r my/downloads/clone/nord-vim/colors .config/vim/

echo "=====:=====:=====           Rebuilding Vim           =====:=====:====="
cd my/downloads/clone/vim-git/
sed -i '46s/disable/enable/' PKGBUILD
sudo pacman -Rns vim
makepkg -si

echo "=====:=====:===== Installing My Core Packages Part 2 =====:=====:====="
sudo pacman -S --needed xmonad{,-contrib} xmobar python-pillow kitty{,-terminfo} && sudo aura -Ax google-chrome && sudo aura -Ax spacefm && sudo pacman -S --needed nitrogen picom dmenu rofi scrot && sudo aura -Ax i3lock-color && sudo pacman -S --needed lxappearance qt5ct arc-gtk-theme kvantum-qt5 papirus-icon-theme imagemagick sxiv mpv celluloid ffmpeg tar unzip zip && sudo aura -Ax rar && sudo pacman -S --needed file-roller udisks2 udevil ntfs-3g gvfs{,-mtp} libmtp mtpfs && sudo aura -Ax jmtpfs && sudo pacman -S --needed libreoffice-fresh gimp inkscape obs-studio && sudo aura -Ax olive && sudo pacman -S --needed zathura{,-cb,-djvu,-pdf-mupdf,-ps}

echo "=====:=====:=====           Installing Tex           =====:=====:====="
sudo pacman -S  texlive{-most,-lang,-bibtexextra}

echo "=====:=====:=====       Installing Virtual Box       =====:=====:====="
sudo pacman -S virtualbox
sudo modprobe vboxdrv
sudo usermod -aG vboxusers ur_username
sudo pacman -S virtualbox-guest-{iso,utils}

echo "=====:=====:=====           Install Clamav           =====:=====:====="
sudo pacman -S clamav
echo "=====:=====:=====         Updating database          =====:=====:====="
sudo freshclam
#=====:=====:===== Im not going to enable clamav-freshclam.service & clamav-daemon.service =====:=====:=====

echo "=====:=====:=====           Install ur IDE           =====:=====:=====
# sudo aura -Ax visual-studio-code-bin
# Kotlin with vscode: https://www.petanikode.com/kotlin-vscode/
# sudo aura -Ax intellij-idea-ce
# sudo pacman -S netbeans
# sudo aura -Ax android-studio
