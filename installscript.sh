#!/bin/bash

# Get the user's home directory
USER_HOME=$(getent passwd "$(whoami)" | cut -d: -f6)

# Set execute permissions for scripts
chmod +x "$USER_HOME/dot-system-BETA/shellpp/necessarypack.sh"
chmod +x "$USER_HOME/dot-system-BETA/shellpp/additionalpack.sh"
chmod +x "$USER_HOME/dot-system-BETA/pypacks/dir.sh"
chmod +x "$USER_HOME/dot-system-BETA/shellpp/additionalfonts.sh"

sleep 5

# Run necessarypack.sh with full path
"$USER_HOME/dot-system-BETA/shellpp/necessarypack.sh"

# Wait for 2 seconds
sleep 2

# Prompt user to run additionalpack.sh
read -p "Do you want to run additionalpack.sh? (Y/N): " choice
if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
    # Run additionalpack.sh with full path
    "$USER_HOME/dot-system-BETA/shellpp/additionalpack.sh"
fi

# Run dir.sh with full path
"$USER_HOME/dot-system-BETA/pypacks/dir.sh"

# Wait for 2 seconds
sleep 2

# Prompt user to run additionalfonts.sh
read -p "Do you want to run additionalfonts.sh? (Y/N): " choice
if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
    # Run additionalfonts.sh with full path
    "$USER_HOME/dot-system-BETA/shellpp/additionalfonts.sh"
fi

# Wait for 2 seconds
sleep 2

echo "Script execution completed."
