#!/bin/bash
echo -e "Removing docker images (please confirm)...\n\n"
docker image prune $1
echo -e "\n\n"
