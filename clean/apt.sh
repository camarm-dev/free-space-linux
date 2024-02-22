#!/bin/bash
echo -e "Cleaning APT cache...\n"
sudo apt clean -y 2> /dev/null
