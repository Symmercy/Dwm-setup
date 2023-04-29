#!/bin/bash

sudo pacman -S git xorg lightdm
mkdir suckless
cd suckless
git clone https://github.com/Symmercy/dwm
cd dwm
sudo make clean install

