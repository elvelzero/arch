#!/bin/bash
#
## My arch install
#

echo "=====:=====:=====        Make a Swapfile         =====:=====:====="
dd if=/dev/zero of=/swap/swapfile bs=1G count=2 status=progress
chmod 600 /swap/swapfile
mkswap /swap/swapfile
swapon /swap/swapfile
echo "" >> /etc/fstab
echo "# /swap/swapfile" >> /etc/fstab
echo "/swap/swapfile    none    swap    defaults    0 0" >> /etc/fstab

echo "=====:=====:=====      Configure Swappiness      =====:=====:====="
touch /etc/sysctl.d/99-swappiness.conf
echo "vm.swappiness=10" >> /etc/sysctl.d/99-swappiness.conf

echo "=====:=====:=====       Configure Timezone       =====:=====:====="
ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
hwclock --systohc

echo "=====:=====:=====        Configure Locale        =====:=====:====="
sed -i '177s/.//' /etc/locale.gen # en_US: change line 177 first char with nothing :)
sed -i '289s/.//' /etc/locale.gen # id_ID
sed -i '302s/.//' /etc/locale.gen # ja_JP
sed -i '313s/.//' /etc/locale.gen # ko_KR
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "=====:=====:=====  Configuring Hostname & Hosts  =====:=====:====="
echo "urHostName" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 urHostName.localdomain urHostName" >> /etc/hosts

echo "=====:=====:=====  Install Base Package I Need   =====:=====:====="
pacman -Syu --needed grub efibootmgr networkmanager ufw alsa-utils pulseaudio{,-alsa} bash-completion dbus-broker xdg-{utils,user-dirs} bat htop lsd neofetch

echo "=====:=====:=====        Installing grub         =====:=====:====="
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
echo "=====:=====:=====      Generate Grub Config      =====:=====:====="
grub-mkconfig -o /boot/grub/grub.cfg

echo "=====:=====:=====     Enabling Some Service      =====:=====:====="
systemctl enable NetworkManager
systemctl enable ufw
systemctl disable dbus.service
systemctl enable dbus-broker.service

echo "=====:=====:=====   Configuring XDG User Dirs    =====:=====:====="
sed -i 's/Desktop/desktop/' /etc/xdg/user-dirs.defaults
sed -i 's/Downloads/my\/downloads/' /etc/xdg/user-dirs.defaults
sed -i 's/Templates/my\/templates/' /etc/xdg/user-dirs.defaults
sed -i 's/Public/my\/public/' /etc/xdg/user-dirs.defaults
sed -i 's/Documents/my\/documents/' /etc/xdg/user-dirs.defaults
sed -i 's/Music/my\/music/' /etc/xdg/user-dirs.defaults
sed -i 's/Pictures/my\/pictures/' /etc/xdg/user-dirs.defaults
sed -i 's/Videos/my\/videos/' /etc/xdg/user-dirs.defaults

echo "=====:=====:=====   Change Your Root Password    =====:=====:====="
passwd
# Add a user
echo "=====:=====:=====         Adding a user          =====:=====:====="
useradd -mG wheel urUserName
echo "=====:=====:=====   Change Your User Password    =====:=====:====="
passwd urUserName
EDITOR=nvim visudo

echo "=====:=====:=====    editing /etc/bash.bashrc    =====:=====:====="
echo "" >> /etc/environment
echo "QT_QPA_PLATFORMTHEME="qt5ct"" >> /etc/environment
cat /tmp/arch/6bashrc.txt >> /etc/bash.bashrc
nvim /etc/bash.bashrc

echo "=====:=====:===== Copy Scripts To User Home Dirs =====:=====:====="
cp -r /tmp/arch /home/urUserName/
chown -R urUserName:urUserName /home/urUserName/arch
echo "=====:=====:=====    Done Copying The Scripts    =====:=====:====="
ls -l /home/urUserName/

echo "=====:=====:=====          Things Left           =====:=====:====="
echo "                  exit umount & reboot. DONE :)                   "
echo "=====:=====:=====          -----------           =====:=====:====="
