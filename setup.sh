#!/bin/bash
# optimise mirrors
sudo pamcan -S reflector
sudo reflector -- verbose --sort  rate - l 30 --save /etc/pacman.d/mirrorlist
sudo pacman -Syy
sudo pacman -Syu
sudo pacman -S xorg lightdm lightdm-gtk-greeter ly ttf-font-awesome feh lxappearance picom wget polkit-gnome ttf-hack flameshot dunst flatpak pamixer --noconfirm
# Installing dependencies
cd ..
mkdir suckless
cd suckless
git clone https://github.com/Symmercy/dwm
git clone https://github.com/Symmercy/dmenu
git clone https://github.com/Symmercy/st
git clone https://github.com/Symmercy/slstatus
#git cloneing & compiling my builds of dwm dmenu st and slstatus
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
#Putting a dwm.desktop file into the correct folder so i can log in
sudo mkdir /usr/share/xsessions
cd ~/dwm-setup
sudo mv dwm.desktop /usr/share/xsessions
#Enableing lightdm
sudo systemctl enable lightdm
#Installing yay
cd ~
mkdir Utils
cd Utils
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
#Installing stuff for themes
yay -S papirus-icon-theme --noconfirm
yay -S dracula-gtk-theme --noconfirm
yay -S layan-cursor-theme-git --noconfirm
#Installing wallpapers
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

#Instaling glorious webkit 2 theme.

git clone https://aur.archlinux.org/lightdm-webkit2-theme-glorious.git
cd lightdm-webkit2-theme-glorious
makepkg -sri --noconfirm
cd ..
sudo cp -r lightdm-webkit2-theme-glorious /usr/share/lightdm-webkit/themes/glorious
sudo sed -i 's/^\(#?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter #\1/ #\2g' /etc/lightdm/lightdm.conf
sudo sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = glorious #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
sudo sed -i 's/^debug_mode\s*=\s*\(.*\)/debug_mode = true #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf

#Putting a place for dmscripts
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
