#!/bin/bash

before="$(df -k -h / | grep / | cut -d ' ' -f 17) / $(df -k -h / | grep / | cut -d ' ' -f 12)"
echo -e "This scripts shows space which can be cleaned... Whith argument --clean, it will autoamticlly clean it (just press enter to confirm !).\n"

echo "APT cache:"
sudo du -sh /var/cache/apt
if [ "$1" = --clean ]; then
	read
	bash clean/apt.sh
fi
echo "Snaps:"
du -h /var/lib/snapd/snaps
if [ "$1" = --clean ]; then
	read
	bash clean/snaps.sh
fi
echo "Cached thumbnails:"
du -sh ~/.cache/thumbnails
if [ "$1" = --clean ]; then
	read
	bash clean/thumbnails.sh
fi
echo "Sytem journal:"
sudo journalctl --disk-usage
if [ "$1" = --clean ]; then
	read
	bash clean/journal.sh
fi
echo "Docker images:"
sudo du -sh /var/lib/docker
if [ "$1" = --clean ]; then
    read
    bash clean/docker.sh
fi
after="$(df -k -h / | grep / | cut -d ' ' -f 17) / $(df -k -h / | grep / | cut -d ' ' -f 12)"

echo "Disk usage;"
echo -e "\tBefore cleaning: $before\n\tAfter cleaning $after"
