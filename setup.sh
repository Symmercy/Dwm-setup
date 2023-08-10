#!/bin/bash

sudo pacman -S xorg lightdm lightdm-gtk-greeter ttf-font-awesome feh lxappearance picom wget polkit-gnome ttf-hack flameshot dunst flatpak --noconfirm
# Installing dependencies
cd ..
mkdir suckless
cd suckless
git clone https://github.com/Symmercy/dwm
git clone https://github.com/Symmercy/dmenu
git clone https://github.com/Symmercy/st
git clone https://github.com/Symmercy/slstatus
#git cloneing my builds of dwm dmenu st and slstatus
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
#Building suckless programs
sudo mkdir /usr/share/xsessions
cd ~/dwm-setup
sudo mv dwm.desktop /usr/share/xsessions
#Copying dwm.desktop from dwm-setup folder to /usr/xsessions
sudo systemctl enable lightdm
#Enableing lightdm
cd ~
mkdir Utils
cd Utils
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
#Installing yay
yay -S papirus-icon-theme --noconfirm
yay -S dracula-gtk-theme --noconfirm
yay -S layan-cursor-theme-git --noconfirm
#themeing
cd ~
mkdir wall
cd wall
# I dont like this one wget https://w.wallhaven.cc/full/95/wallhaven-951e51.png
# Dont like this one either wget https://w.wallhaven.cc/full/6k/wallhaven-6kpdvl.jpg
# wget https://w.wallhaven.cc/full/0w/wallhaven-0wqmpx.jpg
# wget https://w.wallhaven.cc/full/0j/wallhaven-0jmg55.jpg
# wget https://r4.wallpaperflare.com/wallpaper/265/152/1005/nature-sun-sky-landscape-wallpaper-a9d048adb17aad7b462708ef60a1564d.jpg
# wget https://c4.wallpaperflare.com/wallpaper/266/749/195/digital-digital-art-artwork-illustration-drawing-hd-wallpaper-preview.jpg
# Dont like this one either wget https://w.wallhaven.cc/full/jx/wallhaven-jxvk15.png
git clone https://github.com/Gingeh/wallpapers
#Installing wallpapers
cd ..
mkdir scripts
cd scripts
mkdir dmscripts
cd dmscripts
############ add dmenu scripts
cd ..
cd ..
touch .xprofile
echo "feh --no-fehbg --bg-fill --randomize ~/wall/* &" >> .xprofile
echo "picom &" >> .xprofile
echo "slstatus &" >> .xprofile
echo "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &" >> .xprofile
echo "flameshot &" >> .xprofile
echo "Installing DWM and (some other stuff) is finished, feel free to restart your computer"
#Autostart
