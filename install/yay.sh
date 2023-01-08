#!/bin/bash
sudo pacman -S --noconfirm --needed base-devel git
git clone https://aur.archlinux.org/yay-git.git

cd yay-git
makepkg -si --noconfirm
cd ..
rm -rf yay-git
