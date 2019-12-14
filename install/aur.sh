#!/bin/bash
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Not running with sudo"
    exit
fi

aur_packages=(
  google-chrome
  drawio-desktop
  jdk
  javafx11-scenebuilder
  jetbrains-toolbox
  rbenv
  ruby-build
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
