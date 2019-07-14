#!/bin/bash
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Not running with sudo"
    exit
fi

apt_packages=(
  vim
  wkhtmltopdf
  git
  curl
  tree
  htop
  sbt
  gradle
  autoconf
  bison
  build-essential
  libssl-dev
  libyaml-dev
  libreadline6-dev
  zlib1g-dev
  libncurses5-dev
  libffi-dev
  libgdbm5
  libgdbm-dev
  )



apt update #update db

for package in ${apt_packages[@]};
do
  apt install -y $package
done;

# Ruby
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
( cd ~/.rbenv && src/configure && make -C src )
~/.rbenv/bin/rbenv init

mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
