#!/bin/bash
current=$(pwd)

read -p 'Full Name: ' uservar
read -p 'E-Mail Adress: ' mailvar

read -p "Correct? Press [Enter] key to continue..."

sed "s/<USER>/$uservar/g" $current/gitconfig_blueprint > $current/gitconfig
sed -i "s/<MAIL>/$mailvar/g" $current/gitconfig
