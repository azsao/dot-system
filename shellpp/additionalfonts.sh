#!/bin/bash

LOG_FILE="logs/fonts.log"
exec > >(tee -a "$LOG_FILE") 2>&1

log_info() {
    echo -e "$(date +"%H:%M:%S") \e[32m[INFO]\e[0m: $1"
}

log_warning() {
    echo -e "$(date +"%H:%M:%S") \e[33m[WARNING]\e[0m: $1"
}

log_error() {
    echo -e "$(date +"%H:%M:%S") \e[31m[ERROR]\e[0m: $1"
}

check_dependency() {
    if ! command -v "$1" &> /dev/null; then
        log_warning "$1 not found. Installing $1..."
        sudo pacman -S --needed "$1"
    fi
}

install_font() {
    local DOWNLOAD_URL="$1"
    local TEMP_DIR=$(mktemp -d)

    wget -O "$TEMP_DIR/font.zip" "$DOWNLOAD_URL"
    unzip "$TEMP_DIR/font.zip" -d "$TEMP_DIR"
    mkdir -p ~/.local/share/fonts
    cp "$TEMP_DIR"/*.ttf ~/.local/share/fonts/
    fc-cache -f -v
    rm -r "$TEMP_DIR"
}

# Check dependencies
check_dependency "git"
check_dependency "wget"
check_dependency "unzip"

log_info "Installing fonts..."

# Install ttf-ms-win11-auto
package_name="ttf-ms-win11-auto"
git_url="https://aur.archlinux.org/ttf-ms-win11-auto.git"
git clone "$git_url"
cd "$package_name" || exit
makepkg -si --noconfirm
cd ..
rm -rf "$package_name"

# Install Coders_Crux
DOWNLOAD_URL="https://dl.dafont.com/dl/?f=coders_crux"
install_font "$DOWNLOAD_URL"

# Install FontAwesome
DOWNLOAD_URL="https://github.com/FortAwesome/Font-Awesome/archive/master.zip"
install_font "$DOWNLOAD_URL"
log_info "Font Awesome font installed successfully."

# Install Nerd 3270 Font
DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/3270.zip"
install_font "$DOWNLOAD_URL"

log_info "All fonts installed successfully."