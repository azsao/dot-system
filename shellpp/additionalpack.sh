#!/bin/bash

LOG_FILE="logs/additionalpack.log"
exec > >(tee -a "$LOG_FILE") 2>&1

log() {
    echo "$(date +"%H:%M:%S"): $1"
}

# System update
log "Starting system update..."
sudo pacman -Syu --noconfirm
log "System updated. Proceeding..."

# Install Git
if ! command -v git &>/dev/null; then
    log "Git is not installed. Installing..."
    sudo pacman -S git --noconfirm
    log "Git has been installed!"
else
    log "Git is already installed!"
fi

# Clone Cherrytree repository
log "Cloning Cherrytree repository..."
if [ -d cherrytree ]; then
    cd cherrytree || exit
else
    log "Cherrytree directory not found."
fi

sudo pacman -S --noconfirm python-gobject python-gtksourceview3
sudo python3 setup.py install
log "Cherrytree installed."

# Install other packages
declare -a packages=("nemo" "neofetch" "kitty" "bpytop" "picom")
for package in "${packages[@]}"; do
    if ! command -v "$package" &>/dev/null; then
        log "$package is not installed. Installing..."
        sudo pacman -S --noconfirm "$package"
        log "$package has been installed!"
    else
        log "$package is already installed!"
    fi
done

# Install from AUR using yay
# Install from AUR using makepkg and pacman
declare -a aur_packages=("zathura" "firefox" "discord" "telegram" "fish")
for aur_package in "${aur_packages[@]}"; do
    if ! command -v "$aur_package" &>/dev/null; then
        log "$aur_package is not installed. Installing..."
        
        # Clone AUR package
        git clone https://aur.archlinux.org/"$aur_package".git
        cd "$aur_package" || continue
        
        # Build and install package
        makepkg -si --noconfirm
        
        cd ..  # Return to the script's directory
        rm -rf "$aur_package"  # Clean up AUR package directory

        log "$aur_package has been installed!"
    else
        log "$aur_package is already installed!"
    fi
done

# Install Polybar
log "Downloading and installing Polybar..."
git clone https://github.com/polybar/polybar
if [ -d polybar ]; then
    cd polybar || exit  # Change into the polybar directory
    mkdir build
    cd build || exit
    cmake ..
    make -j$(nproc)
    sudo make install
    log "Polybar installed from GitHub repo."
else
    log "Polybar directory not found."
fi

# Install Rofi
log "Downloading and installing Rofi..."
git clone https://github.com/davatorium/rofi.git
if [ -d rofi ]; then
    cd rofi/build || exit
    ../configure
    make
    sudo make install
    log "Rofi installed from GitHub repo."
else
    log "Rofi directory not found."
fi

# Install Flameshot
if ! command -v flameshot &>/dev/null; then
    log "Flameshot is not installed. Installing..."
    sudo pacman -S --noconfirm flameshot
    log "Flameshot has been installed!"
else
    log "Flameshot is already installed!"
fi

log "Script execution completed."
