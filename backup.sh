#!/bin/bash
set -euo pipefail

# Pretty timestamp
now() { date '+%Y-%m-%d %H:%M:%S'; }

echo "Enter folder path to backup:"
read folder

# Validate
if [ -z "${folder:-}" ] || [ ! -d "$folder" ]; then
  echo "[ERROR] $(now) Invalid folder: '$folder'"
  exit 1
fi

# Ensure dirs
mkdir -p backups logs

# Names
base="$(basename "$folder")"
stamp="$(date +'%Y-%m-%d-%H-%M-%S')"
archive="backups/${base}-${stamp}.tar.gz"
proj="$(basename "$PWD")"   # e.g., capstone-bash-suite (to avoid self-inclusion)

echo "----------------------------------------"
echo "[START]   $(now)"
echo "[SOURCE]  $folder"
echo "[ARCHIVE] $archive"
echo "----------------------------------------"

# If you're backing up Desktop and this project lives inside Desktop,
# exclude this project folder to avoid tar warning & infinite growth.
# (Safe even if it doesn't exist inside SOURCE.)
tar -czf "$archive" --exclude="$folder/$proj" "$folder"

echo "[DONE]    $(now)"
echo "[SAVED]   $archive"
echo "----------------------------------------"

# Log it too
{
  echo "$(now) [OK] $folder -> $archive"
} >> logs/backup.log
