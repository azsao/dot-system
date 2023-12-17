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

# install cherrytree
log "Cloning Cherrytree repository..."
git clone https://github.com/giuspen/cherrytree.git
cd cherrytree || exit
sudo pacman -S --noconfirm python-gobject python-gtksourceview3
sudo python3 setup.py install
log "Cherrytree installed."

# installs nemo
if ! command -v nemo &>/dev/null; then
    log "nemo is not installed. Installing..."
    sudo pacman -S --noconfirm nemo
    log "nemo has been installed!"
else
    log "nemo is already installed!"
fi

# installs neofetch
if ! command -v neofetch &>/dev/null; then
    log "nemo is not installed. Installing..."
    sudo pacman -S --noconfirm neofetch
    log "neofetch has been installed!"
else
    log "neofetch is already installed!"
fi

# installs kitty
if ! command -v kitty &>/dev/null; then
    log "kitty is not installed. Installing..."
    sudo pacman -S --noconfirm kitty
    log "kitty has been installed!"
else
    log "kitty is already installed!"
fi

# Install Zathura
yay -S zathura --noconfirm
log "Zathura installed from AUR."

# Install Firefox
yay -S firefox --noconfirm
log "firefox installed from AUR."

# Install Discord
yay -S discord --noconfirm
log "discord installed from AUR."

# Install Telegram
yay -S telegram --noconfirm
log "telegram installed from AUR."

# Install Fish shell
if ! command -v fish &>/dev/null; then
    log "Fish is not installed. Downloading and installing..."
    sudo pacman -S fish --noconfirm
    log "Fish installed from official repositories."
else
    log "Fish is already installed!"
fi

# Install Polybar
log "Downloading and installing Polybar..."
git clone https://github.com/polybar/polybar
cd polybar || exit
mkdir build
cd build || exit
cmake ..
make -j$(nproc)
sudo make install
log "Polybar installed from GitHub repo."

# Install Rofi
log "Downloading and installing Rofi..."
git clone https://github.com/davatorium/rofi.git
cd rofi || exit
autoreconf -i
mkdir build
cd build || exit
../configure
make
sudo make install
log "Rofi installed from GitHub repo."

# Install Flameshot
if ! command -v flameshot &>/dev/null; then
    log "Flameshot is not installed. Installing..."
    sudo pacman -S --noconfirm flameshot
    log "Flameshot has been installed!"
else
    log "Flameshot is already installed!"
fi

# Install Bpytop
if ! command -v bpytop &>/dev/null; then
    log "Bpytop is not installed. Installing..."
    sudo pacman -S --noconfirm bpytop
    log "Bpytop has been installed!"
else
    log "Bpytop is already installed!"
fi

# Install picom
sudo pacman -S picom    
log "Picom has been installed"  

log "Script execution completed."


