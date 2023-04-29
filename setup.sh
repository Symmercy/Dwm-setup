#!/bin/bash

sudo pacman -S xorg lightdm lightdm-gtk-greeter dmenu ttf-font-awesome
mkdir suckless
cd suckless
git clone https://github.com/Symmercy/dwm
cd dwm
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
