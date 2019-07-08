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



pacman -Sy #update db

for package in ${pacman_packages[@]};
do
  pacman -S --needed --noconfirm $package
done;
