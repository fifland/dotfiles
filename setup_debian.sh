#!/bin/bash

if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Not running with sudo"
    exit
fi

current=$(pwd)

echo "Setup-Script Started"

echo "Generating GitConfig"
sh bin/generate_gitconfig.sh

echo "Setting up: zshrc"
ln -sf $current/zshrc ~/.zshrc

echo "Setting up: gitconfig"
ln -sf $current/gitconfig ~/.gitconfig

read -r -p "Install zsh? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        apt-get install -y zsh
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install APT Packages? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        sh install/apt.sh
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install Docker? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        sh install/docker-apt.sh
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install Firewall (IPtables & Ferm)? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        sh install/firewall_deb.sh
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install VMWare Tools? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        apt-get install open-vm-tools
        ;;
    *)
        echo "Skipping..."
        ;;
esac


read -r -p "Set zsh default? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        if which zsh &> /dev/null; then
            #sudo sed -i -e 's/bash$/zsh/g' /etc/passwd
            chsh -s /bin/zsh
        else
            echo "zsh is not installed! Please it install first"
        fi
        ;;
    *)
        echo "Skipping..."
        ;;
esac
