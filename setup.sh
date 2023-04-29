#!/bin/bash

sudo pacman -S xorg lightdm lightdm-gtk-greeter ttf-font-awesome nitrogen
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
cd ~/Dwm-setup
sudo mv dwm.desktop /usr/share/xsessions
sudo systemctl enable lightdm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo "Do you want to reboot? (Y/N)"
read $answer
if [[ $answer == y ]]
then
  reboot
fi
