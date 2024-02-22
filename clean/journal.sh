#!/bin/bash
echo -e "Deleting logs (keeping 3days log)... \n"
sudo journalctl --vacuum-time=3d 2> /dev/null
