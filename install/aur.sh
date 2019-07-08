#!/bin/bash
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Not running with sudo"
    exit
fi

aur_packages=(
  google-chrome
  drawio-desktop
  insync
  jdk
  javafx11-scenebuilder
  jetbrains-toolbox
  rbenv
  ruby-build
  spotify
  )

pikaur -Sy

for package in ${aur_packages[@]};
do
  pikaur -S --noconfirm $package
done;
