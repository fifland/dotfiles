#!/bin/bash
read -p 'Full Name: ' uservar
read -p 'E-Mail Adress: ' mailvar

read -p "Correct? Press [Enter] key to continue..."

sed "s/<USER>/$uservar/g" ../gitconfig_blueprint > ../gitconfig
sed -i "s/<MAIL>/$mailvar/g" ../gitconfig
