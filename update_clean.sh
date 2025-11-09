#!/bin/bash

echo "Checking for system update tool..."

# Check if 'apt' exists (Linux/WSL)
if command -v apt >/dev/null 2>&1; then
  echo "APT found. Running system update..."
  sudo apt update
  sudo apt upgrade -y
  sudo apt autoremove -y
  echo "System updated successfully!"
else
  echo "APT not found (Windows Git Bash). Skipping update. This is normal on Windows."
fi
