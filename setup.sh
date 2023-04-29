#!/bin/bash

sudo pacman -S xorg lightdm
mkdir suckless
cd suckless
git clone https://github.com/Symmercy/dwm
cd dwm
sudo make clean install
sudo mkdir /usr/share/xsessions
cd ~/Dwm-setup
sudo mv dwm.desktop /usr/share/xsessions
sudo systemctl enable lightdm

echo "Do you want to reboot? (Y/N)"
read $answer
if [[ $answer == y ]]
then
  reboot
fi
