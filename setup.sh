# Setup the environment by copying & HARDLINKING the dotfiles

current=$(pwd)

echo "Setting up: zsh"
ln -sf $current/zshrc ~/.zshrc

echo "Setting up: git"
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

read -r -p "Install Pikaur? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        sh install/pikaur.sh
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install Pacman Packages? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        sudo sh install/most.sh
        ;;
    *)
        echo "Skipping..."
        ;;
esac

read -r -p "Install AUR Packages? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        sudo sh install/aur.sh
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
        sudo sed -i -e 's/bash$/zsh/g' /etc/passwd
        ;;
    *)
        echo "Skipping..."
        ;;
esac
