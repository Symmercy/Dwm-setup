#!/bin/bash

# optimise mirrors
sudo pacman -S reflector
sudo reflector -- verbose --sort  rate - l 30 --save /etc/pacman.d/mirrorlist
sudo pacman -Syy
sudo pacman -Syu

#Installing dependencies
sudo pacman -S xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk ly ttf-font-awesome feh lxappearance picom wget polkit-gnome ttf-hack flameshot dunst flatpak pamixer neovim unzip cargo --noconfirm
cd ..
mkdir suckless
cd suckless

#Installing exa (prettier ls) with cargo
cargo install exa
echo "PATH="$HOME/.cargo/bin${PATH:+:${PATH}}""

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

#Installing paru
cd ~
mkdir Utils
cd Utils
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm

#Installing themes
yay -S papirus-icon-theme --noconfirm
yay -S dracula-gtk-theme --noconfirm
yay -S layan-cursor-theme-git --noconfirm

#Installing wallpapers
cd ~
git clone https://github.com/zhichaoh/catppuccin-wallpapers
mv catppuccin-wallpapers wall

#Putting a place for dmscripts (add dmenu scripts your self)
cd ~/Utils
mkdir dmscripts

#Going to home
cd ~

# starship install
curl -sS https://starship.rs/install.sh | sh
echo "eval "$(starship init bash)"" >> .bashrc
starship preset nerd-font-symbols -o ~/.config/starship.toml

# adding nerd font
mkdir Download-temp
cd Download-temp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
unzip CascadiaCode.zip
sudo mkdir /usr/share/fonts/CascadiaCode
sudo mv *.ttf /usr/share/fonts/CascadiaCode
rm -rf CascadiaCode.zip
sudo fc-cache -fv

#Autostart
cd ~
touch .xprofile
echo "feh --no-fehbg --bg-fill ~/wall/minimalistic/gradient-synth-cat.png &" >> .xprofile
echo "picom &" >> .xprofile
echo "slstatus &" >> .xprofile
echo "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &" >> .xprofile
echo "flameshot &" >> .xprofile

#Adding aliases to .bashrc
echo "alias vim="nvim"" >> ~/.bashrc
echo "alias paru="yay"" >> ~/.bashrc
echo "alias ls="exa -al --color=always --group-directories-first""

# Telling the user that it is finished
echo "Installing DWM and (some other stuff) is finished, feel free to restart your computer"