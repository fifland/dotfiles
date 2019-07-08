#!/bin/bash
pacman_packages=(
  thunderbird
  firefox
  vlc
  vim
  atom
  texlive-most
  texlive-lang
  biber
  hunspell-de
  inkscape
  wkhtmltopdf
  git
  curl
  tree
  htop
  docker
  docker-compose
  ruby
  python
  scala
  scala-docs
  scala-sources
  sbt
  gradle
  telegram-desktop
  teamspeak3
  )

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

pacman -Sy #update db

for package in ${pacman_packages[@]};
do
  pacman -S --needed --noconfirm $package
done;

for package in ${aur_packages[@]};
do
  pikaur -S --noconfirm $package
done;
