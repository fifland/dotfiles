#!/bin/bash
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Not running with sudo"
    exit
fi

aur_packages=(
  drawio-desktop
  javafx11-scenebuilder
  slack-desktop
  zoom
  anydesk-bin
  eagle
  ddrescue-gui
  edex-ui-bin
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
