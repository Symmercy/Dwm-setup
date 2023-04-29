#!/bin/bash

sudo pacman -S xorg lightdm lightdm-gtk-greeter ttf-font-awesome nitrogen
mkdir suckless
cd suckless
git clone https://github.com/Symmercy/dwm
git clone https://git.suckless.org/dmenu
cd dwm
sudo make clean install
cd ..
cd dmenu
sudo make clean insall
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
