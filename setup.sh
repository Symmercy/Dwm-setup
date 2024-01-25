#!/bin/bash

# optimise mirrors
sudo pacman -S reflector
sudo reflector --verbose --sort rate -l 30 --save /etc/pacman.d/mirrorlist

#Upgrading
sudo pacman -Syyu --noconfirm
sleep 3
#Installing dependencies
sudo pacman -S xorg xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk ly ttf-font-awesome feh lxappearance picom wget polkit-gnome ttf-hack flameshot dunst flatpak pamixer neovim unzip eza
sleep 5
# Making a directory for suckless software
cd ~
mkdir .local
mkdir .local/.src

#Making a config for other software like yay
mkdir .local/.utils

#Going to the directory for suckless software
cd .local/.src

#Compiling my builds of suckless software
git clone https://github.com/Symmercy/dwm
git clone https://github.com/Symmercy/dmenu
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

#Putting a dwm.desktop file into the correct folder so i can log in
sudo mkdir /usr/share/xsessions
cd ~/dwm-setup
sudo mv dwm.desktop /usr/share/xsessions

#Installing yay (aur helper)
cd ~/.local/.utils
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

#Installing themes
yay -S papirus-icon-theme --noconfirm
yay -S dracula-gtk-theme --noconfirm
yay -S layan-cursor-theme-git --noconfirm

#Installing aur software
yay -S brave-bin --noconfirm

#Installing wallpapers
cd ~
git clone https://github.com/zhichaoh/catppuccin-wallpapers
mv catppuccin-wallpapers wall

#Going to home
cd ~

# starship install
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >>.bashrc
starship preset nerd-font-symbols -o ~/.config/starship.toml

# adding nerd font
mkdir Download-temp
cd Download-temp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
unzip CascadiaCode.zip
sudo mkdir /usr/share/fonts/CascadiaCode
sudo mv *.ttf /usr/share/fonts/CascadiaCode
rm -rf CascadiaCode.zip
cd ~
rm -rf Download-temp
sudo fc-cache -fv

#Autostart
cd ~
touch .xprofile
echo "feh --no-fehbg --bg-fill ~/wall/minimalistic/gradient-synth-cat.png &" >>.xprofile
echo "picom &" >>.xprofile
echo "slstatus &" >>.xprofile
echo "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &" >>.xprofile
echo "flameshot &" >>.xprofile
echo "xcopy &" >>.xprofile

#Adding aliases to .bashrc
echo "alias vim=\"nvim\"" >>~/.bashrc
echo "alias paru=\"yay\"" >>~/.bashrc
echo "alias ls=\"eza -al --color=always --group-directories-first\"" >>~/.bashrc

#Adding an xresources file (catppuccin)
cd ~
git clone https://github.com/catppuccin/xresources
mv xresources xresources-temp
cd xresources-temp
mv macchiato.Xresources Xresources
mv Xresources ~
rm -rf xresources-temp

#Installing lazyvim
cd ~/.config
rm -rf nvim
git clone https://github.com/LazyVim/starter
mv starter nvim

#Asking user about bluetooth, and setting up if the user types y
echo "Do you want to set up bluetooth"
echo "(y/n)"
read bluetooth-choice

# Telling the user that it is finished and asking if the user wants to reboot
echo "Installing DWM is finished do you want to restart your PC"
echo "(y/n)"
read reboot-choice

#if statement for rebooting
if [[ $reboot-choice == "y" ]]; then
	reboot
else
	exit 0
fi
