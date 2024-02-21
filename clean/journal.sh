#!/bin/bash
echo "Deleted logs (keeping 3days log)..."
sudo journalctl --vacuum-time=3d
