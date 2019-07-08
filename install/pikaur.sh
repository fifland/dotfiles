#!/bin/bash
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Not running with sudo"
    exit
fi

sudo pacman -S --noconfirm --needed base-devel git
git clone https://aur.archlinux.org/pikaur.git


cd pikaur
makepkg -fsri --noconfirm
cd ..
rm -rf pikaur
