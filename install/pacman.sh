#!/bin/bash
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Not running with sudo"
    exit
fi

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
  jre-openjdk-headless
  jre-openjdk
  jdk-openjdk
  openjdk-doc
  openjdk-src
  ruby
  python
  scala
  scala-docs
  scala-sources
  sbt
  gradle
  plasma-browser-integration
  python-pygments
  pygmentize
  wavemon
  unzip
  pandoc
  plantuml
  )



pacman -Sy #update db

for package in ${pacman_packages[@]};
do
  pacman -S --needed --noconfirm $package
done;
