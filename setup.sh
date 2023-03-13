#!/bin/bash
current=$(pwd)

echo "Setup-Script Started"

echo "Generating GitConfig"
sh bin/generate_gitconfig.sh

echo "Setting up: zshrc"
ln -sf $current/zshrc ~/.zshrc

echo "Setting up: gitconfig"
ln -sf $current/gitconfig ~/.gitconfig

echo "Starting full system update"
sudo pacman --noconfirm -Syyu

read -r -p "Install zsh? [y/N] (recommended) " response
case "$response" in
    [yY][eE][sS]|[yY])
        sudo pacman --noconfirm -Sy zsh
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install Yay? (AUR Helper) [y/N] (recommended) " response
case "$response" in
    [yY][eE][sS]|[yY])
        sudo pacman --noconfirm -Sy yay
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install Pacman Packages? [y/N] (recommended) " response
case "$response" in
    [yY][eE][sS]|[yY])
        sudo sh install/pacman.sh
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install Pacman non essential Packages? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        sudo sh install/pacman_nonessential.sh
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install AUR Packages? [y/N] (recommended) " response
case "$response" in
    [yY][eE][sS]|[yY])
        if which yay &> /dev/null; then
            sudo sh install/aur.sh
        else
            echo "yay is not installed! Please install it first"
        fi
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install non essential AUR Packages? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        if which yay &> /dev/null; then
            sudo sh install/aur_nonessential.sh
        else
            echo "yay is not installed! Please install it first"
        fi
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install Insync (Google Drive & OneDrive Sync Client)? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        if which pikaur &> /dev/null; then
            sudo yay -Sy --noconfirm insync
            sudo yay -Sy --noconfirm insync-dolphin
        else
            echo "yay is not installed! Please install it first"
        fi
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install Spotify? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        if which yay &> /dev/null; then
            sudo yay -S spotify
        else
            echo "yay is not installed! Please install it first"
        fi
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install CKB-Next Corsair Driver? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        if which yay &> /dev/null; then
            sudo yay -Sy --noconfirm ckb-next
        else
            echo "yay is not installed! Please install it first"
        fi
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install OBS? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        if which yay &> /dev/null; then
            sudo sh install/obs.sh
        else
            echo "yay is not installed! Please install it first"
        fi
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Set zsh default? [y/N]  (recommended) " response
case "$response" in
    [yY][eE][sS]|[yY])
        if which zsh &> /dev/null; then
            #sudo sed -i -e 's/bash$/zsh/g' /etc/passwd
            chsh -s /bin/zsh
        else
            echo "zsh is not installed! Please install it first"
        fi
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Increase Inotify Watches Limit? [y/N]  (recommended) " response
case "$response" in
    [yY][eE][sS]|[yY])
        sudo sh bin/increase_inotify_watches.sh
        ;;
    *)
        echo "Skipping..."
        ;;
esac
