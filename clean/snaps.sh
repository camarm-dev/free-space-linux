#!/bin/bash
echo -e "Cleaning disabled snaps...\n"
set -eu
snap list --all | awk '/désactivé/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
