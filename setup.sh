#!/bin/bash

sudo pacman -S xorg lightdm lightdm-gtk-greeter ttf-font-awesome nitrogen lxappearance picom --noconfirm
cd ..
mkdir suckless
cd suckless
git clone https://github.com/Symmercy/dwm
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/st
cd dwm
sudo make clean install
cd ..
cd dmenu
sudo make clean install
cd ..
cd st
sudo make clean install
sudo mkdir /usr/share/xsessions
cd ~/dwm-setup
sudo mv dwm.desktop /usr/share/xsessions
sudo systemctl enable lightdm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S papirus-icon-theme --noconfirm
yay -S dracula-gtk-theme --noconfirm
yay -S layan-cursor-theme-git --noconfirm
cd ~
touch .xprofile
echo "nitrogen --restore" >> .xprofile
echo "picom" >> .profile
echo "Installing and themeing DWM is finished, you can restart your computer"

