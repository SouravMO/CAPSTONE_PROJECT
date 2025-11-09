#!/bin/bash

while true
do
  clear
  echo "=== SYSTEM MAINTENANCE MENU ==="
  echo "1. Backup Folder"
  echo "2. System Update & Cleanup"
  echo "3. Scan Logs"
  echo "4. Exit"
  echo "Enter choice:"
  read ch

  case $ch in
    1) bash backup.sh ;;
    2) bash update_clean.sh ;;
    3) bash log_watch.sh ;;
    4) exit ;;
    *) echo "Invalid option!" ;;
  esac

  echo "Press ENTER to continue..."
  read
done
