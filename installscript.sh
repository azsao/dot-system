#!/bin/bash

# Run shellpp\necessarypack.sh
./shellpp/necessarypack.sh

# Wait for 2 seconds
sleep 2

# Prompt user to run shellpp\additionalpack.sh
read -p "Do you want to run shellpp\additionalpack.sh? (Y/N): " choice
if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
    ./shellpp/additionalpack.sh
fi

# Run pypacks\dir.sh
./pypacks/dir.sh

# Wait for 2 seconds
sleep 2

# Prompt user to run shellpp\additionalfonts.sh
read -p "Do you want to run shellpp\additionalfonts.sh? (Y/N): " choice
if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
    ./shellpp/additionalfonts.sh
fi

# Wait for 2 seconds
sleep 2

echo "Script execution completed."
