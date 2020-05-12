#!/bin/bash
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Not running with sudo"
    exit
fi

apt-get update #update db

apt-get install -y iptables ferm

read -r -p "Load custom Ferm defaults? [y/N]" response
case "$response" in
    [yY][eE][sS]|[yY])
        cp -f ../ferm.conf /etc/ferm/ferm.conf
        ;;
    *)
        echo "Skipping..."
        ;;
esac
