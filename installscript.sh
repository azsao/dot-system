#!/bin/bash

# Get the user's home directory
USER_HOME=$(getent passwd "$(whoami)" | cut -d: -f6)

# Define script paths
NECESSARY_PACK_SCRIPT="$USER_HOME/dot-system-main/shellpp/necessarypack.sh"
ADDITIONAL_PACK_SCRIPT="$USER_HOME/dot-system-main/shellpp/additionalpack.sh"
DIR_SCRIPT="$USER_HOME/dot-system-main/pypacks/dir.sh"
ADDITIONAL_FONTS_SCRIPT="$USER_HOME/dot-system-main/shellpp/additionalfonts.sh"

# Set execute permissions for scripts
chmod +x "$NECESSARY_PACK_SCRIPT"
chmod +x "$ADDITIONAL_PACK_SCRIPT"
chmod +x "$DIR_SCRIPT"
chmod +x "$ADDITIONAL_FONTS_SCRIPT"

sleep 5

# Run necessarypack.sh with full path
"$NECESSARY_PACK_SCRIPT"

# Prompt user to run additionalpack.sh
read -p "Do you want to run additionalpack.sh? (Y/N): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
    # Run additionalpack.sh with full path
    "$ADDITIONAL_PACK_SCRIPT"
fi

# Run dir.sh with full path
"$DIR_SCRIPT"

# Wait for 2 seconds
sleep 2

# Prompt user to run additionalfonts.sh
read -p "Do you want to run additionalfonts.sh? (Y/N): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
    # Run additionalfonts.sh with full path
    "$ADDITIONAL_FONTS_SCRIPT"
fi

# Wait for 2 seconds
sleep 2

echo "Script execution completed."
