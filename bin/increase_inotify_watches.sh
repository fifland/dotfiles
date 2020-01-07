#!/bin/bash
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Not running with sudo"
    exit
fi

echo "fs.inotify.max_user_watches = 524288" > /etc/sysctl.d/50-max_user_watches.conf
sysctl -p --system
