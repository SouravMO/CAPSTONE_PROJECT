#!/bin/bash

log_file="update_clean.sh"

echo "Scanning log file for errors..."
if grep -Ei "ERROR|FAILED" "$log_file" >/dev/null 2>&1; then
  echo "Errors found:"
  grep -Ei "ERROR|FAILED" "$log_file"
else
  echo "No errors found!"
fi
