#!/bin/bash

# Get the username from the system
USERNAME=$USER

# Sanitize the input
USERNAME=$(echo "$USERNAME" | tr -cd '[:alnum:]')

USER_HOME="/home/$USERNAME"
CONFIG_DIR="$USER_HOME/.config"
SOURCE_DIR="$USER_HOME/dot-system-main/config"
LOG_FILE="logs/dir.log"

# Function to create directory if it doesn't exist
create_directory() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
    echo "Created directory: $1"
  fi
}

# Function to log errors
log_error() {
  echo "$(date +"%H:%M:%S") [ERROR]: $1" >> "$LOG_FILE"
}

# Check if the user's home directory exists
if [ ! -d "$USER_HOME" ]; then
  log_error "User home directory '$USER_HOME' not found."
  exit 1
fi

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  log_error "Source directory '$SOURCE_DIR' not found."
  exit 1
fi

# Move dot files config
shopt -s dotglob
create_directory "$CONFIG_DIR"
mv "$SOURCE_DIR/"* "$CONFIG_DIR/" 2>> "$LOG_FILE"

# Move specific config directories
config_directories=("polybar" "i3" "rofi" "picom")
for dir in "${config_directories[@]}"; do
  create_directory "$CONFIG_DIR/$dir"
  mv "$SOURCE_DIR/$dir/"* "$CONFIG_DIR/$dir/" 2>> "$LOG_FILE"
done

shopt -u dotglob

echo "Configuration files moved successfully."