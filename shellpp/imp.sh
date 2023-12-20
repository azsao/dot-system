#!/bin/sh

# Specify variables 
ERROR_MSG="ERROR: Specified directory not found"
USER=$(whoami)

sleep 2

shopt -s dotglob
OUTDATED=("${USER}/.config/polybar" "${USER}/.config/rofi" "${USER}/.config/i3" "${USER}/.config/insertname")

# List of functions
for dir in "${OUTDATED[@]}"; do
    if [ -d "$dir" ]; then
        rmdir "$dir"
    else
        echo "$ERROR_MSG"
    fi
done

shopt -u dotglob

echo "imp.sh executed successfully, proceeding"