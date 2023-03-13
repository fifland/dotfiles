#!/bin/bash
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Not running with sudo"
    exit
fi

pacman_packages=(
  obs-studio
  v4l2loopback-dkms
  )

pacman -Sy #update db

for package in ${pacman_packages[@]};
do
  pacman -S --needed --noconfirm $package
done;

pacman -S linux-headers


aur_packages=(
  obs-freeze-filter
  obs-streamfx
  )

yay -Sy

for package in ${aur_packages[@]};
do
  if which yay &> /dev/null; then
      sudo yay -S --noconfirm $package
  else
      echo "yay is not installed! Please install it first"
  fi
done;

dkms autoinstall
