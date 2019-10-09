current=$(pwd)

echo "Setup-Script Started"

echo "Generating GitConfig"
sh bin/generate_gitconfig.sh

echo "Setting up: zshrc"
ln -sf $current/zshrc ~/.zshrc

echo "Setting up: gitconfig"
ln -sf $current/gitconfig ~/.gitconfig

echo "Setting up: vim"
ln -sf $current/vimrc ~/.vimrc
cp -r $current/vim ~/vim
rm -r ~/.vim
mv ~/vim ~/.vim

echo "Setting up: prelude"
mkdir ~/.emacs.d
mkdir ~/.emacs.d/personal
ln -s $current/emacs_personal ~/.emacs.d/personal

echo "Setting up: sbt plugins"
sbt_plugins_path=~/.sbt/1.0/plugins
mkdir -p $sbt_plugins_path
ln -sf $current/sbt/plugins.sbt $sbt_plugins_path/plugins.sbt

read -r -p "Install zsh? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        sudo apt-get install -y zsh
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install APT Packages? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        sudo sh install/apt.sh
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install Docker? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        sudo sh install/docker-apt.sh
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install Atom Packages? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        sh install/atom.sh
        ;;
    *)
        echo "Skipping..."
        ;;
esac


read -r -p "Set zsh default? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        if which fish &> /dev/null; then
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
