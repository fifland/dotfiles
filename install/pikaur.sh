#!/bin/bash
sudo pacman -S --noconfirm --needed base-devel git
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri --noconfirm
cd ..
rm -f pikaur
