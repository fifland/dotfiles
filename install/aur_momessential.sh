#!/bin/bash
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Not running with sudo"
    exit
fi

aur_packages=(
  drawio-desktop
  javafx11-scenebuilder
  slack-desktop
  )

pikaur -Sy

for package in ${aur_packages[@]};
do
  if which pikaur &> /dev/null; then
      sudo pikaur -S --noconfirm $package
  else
      echo "Pikaur is not installed! Please install it first"
  fi
done;
