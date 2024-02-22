#!/bin/bash

before="$(df -k -h / | grep / | cut -d ' ' -f 17) / $(df -k -h / | grep / | cut -d ' ' -f 12)"
echo -e "This scripts shows space which can be cleaned... Press ENTER to clean component, n to pass.\n"

read -r -p "$(sudo du -sh -P /var/cache/apt | awk '{print $1}') of APT cache [ENTER/n]" choice
if [ "$choice" != n ]; then
	bash clean/apt.sh
fi

read -r -p "$(snap list --all | awk '/désactivé/{print $1, $3}' | wc -l) unused snaps [ENTER/n]" choice
if [ "$choice" != n ]; then
	bash clean/snaps.sh
fi

read -r -p "$(du -sh -P ~/.cache/thumbnails | awk '{print $1}') of cached thumbnails [ENTER/n]" choice
if [ "$choice" != n ]; then
	bash clean/thumbnails.sh
fi

read -r -p "$(sudo journalctl --disk-usage | awk '{print $7}') of sytem journal (enter to keep only 3 past days) [ENTER/n]" choice
if [ "$choice" != n ]; then
	bash clean/journal.sh
fi

read -r -p "$(sudo du -sh -P /var/lib/docker | awk '{print $1}') of docker ressources; (-a removes all images, enter removed unused ones) [ENTER/n/-a]" choice
if [ "$choice" != n ]; then
    bash clean/docker.sh $choice
fi

after="$(df -k -h / | grep / | cut -d ' ' -f 17) / $(df -k -h / | grep / | cut -d ' ' -f 12)"

echo "Disk usage;"
echo -e "\tBefore cleaning: $before\n\tAfter cleaning $after"
