#!/bin/bash

LOG_FILE="logs/fonts.log"
exec > >(tee -a "$LOG_FILE") 2>&1

log() {
    echo "$(date +"%H:%M:%S"): $1"
}

# Install MSFonts
if ! yay -Qi ttf-ms-win10-auto &>/dev/null; then
    log "ttf-ms-win10-auto is not installed. Downloading and installing..."
    yay -S ttf-ms-win10-auto --noconfirm
    log "ttf-ms-win10-auto has been installed!"
else
    log "ttf-ms-win10-auto is already installed!"
fi

# Install Coders_Crux
DOWNLOAD_URL="https://dl.dafont.com/dl/?f=coders_crux"
TEMP_DIR=$(mktemp -d)
wget -O "$TEMP_DIR/coders_crux.zip" "$DOWNLOAD_URL"
unzip "$TEMP_DIR/coders_crux.zip" -d "$TEMP_DIR"
cp "$TEMP_DIR"/*.ttf ~/.local/share/fonts/
fc-cache -f -v
rm -r "$TEMP_DIR"

# Install FontAwesome
DOWNLOAD_URL="https://github.com/FortAwesome/Font-Awesome/archive/master.zip"
TEMP_DIR=$(mktemp -d)
wget -O "$TEMP_DIR/fontawesome.zip" "$DOWNLOAD_URL"
unzip "$TEMP_DIR/fontawesome.zip" -d "$TEMP_DIR"
mkdir -p ~/.local/share/fonts
cp "$TEMP_DIR/Font-Awesome-master/webfonts/"*.ttf ~/.local/share/fonts/
fc-cache -f -v
rm -r "$TEMP_DIR"
echo "Font Awesome font installed successfully."

# Install Nerd 3270 Font
DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/3270.zip"
TEMP_DIR=$(mktemp -d)
wget -O "$TEMP_DIR/3270.zip" "$DOWNLOAD_URL"
unzip "$TEMP_DIR/3270.zip" -d "$TEMP_DIR"
mkdir -p ~/.local/share/fonts
cp "$TEMP_DIR"/*.ttf ~/.local/share/fonts/
fc-cache -f -v
rm -r "$TEMP_DIR"