#!/bin/bash

sudo pacman -S xorg lightdm lightdm-gtk-greeter ttf-font-awesome feh lxappearance picom wget polkit-gnome --noconfirm
cd ..
mkdir suckless
cd suckless
git clone https://github.com/Symmercy/dwm
git clone https://git.suckless.org/dmenu
git clone https://github.com/Symmercy/st
git clone https://github.com/Symmercy/slstatus
cd dwm
sudo make clean install
cd ..
cd dmenu
sudo make clean install
cd ..
cd st
sudo make clean install
cd ..
cd slstatus
sudo make clean install
sudo mkdir /usr/share/xsessions
cd ~/dwm-setup
sudo mv dwm.desktop /usr/share/xsessions
sudo systemctl enable lightdm
cd ~
mkdir Utils
cd Utils
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S papirus-icon-theme --noconfirm
yay -S dracula-gtk-theme --noconfirm
yay -S layan-cursor-theme-git --noconfirm
cd ~
mkdir wall
cd wall
wget https://w.wallhaven.cc/full/95/wallhaven-951e51.png
cd ..
touch .xprofile
echo "feh --no-fehbg --bg-fill ~/wall/wallhaven-951e51.png &" >> .xprofile
echo "picom &" >> .xprofile
echo "slstatus &" >> .xprofile
echo "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &"
echo "Installing DWM and (some other stuff) is finished, you can restart your computer"

