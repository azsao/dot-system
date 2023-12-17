#!/bin/bash

read -p "Enter the username: " USERNAME

USER_HOME="/home/$USERNAME"
CONFIG_DIR="$USER_HOME/.config"

# Function to create directory if it doesn't exist
create_directory() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
  fi
}

# Move dot files config
shopt -s dotglob

# Move polybar config
create_directory "$CONFIG_DIR/polybar"
mv "$USER_HOME/dot-system-main/config/polybar/"* "$CONFIG_DIR/polybar/"

# Move i3 config
create_directory "$CONFIG_DIR/i3"
mv "$USER_HOME/dot-system-main/config/i3/"* "$CONFIG_DIR/i3/"

# Move rofi config
create_directory "$CONFIG_DIR/rofi"
mv "$USER_HOME/dot-system-main/config/rofi/"* "$CONFIG_DIR/rofi/"

# Move picom config
create_directory "$CONFIG_DIR/picom"
mv "$USER_HOME/dot-system-main/config/picom/"* "$CONFIG_DIR/picom/"

shopt -u dotglob