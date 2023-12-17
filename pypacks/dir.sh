
# Make Font Directories
mkdir -p ~/.local/share/fonts


# move dot files config
shopt -s dotglob
mv ~/dot-system-BETA/config/polybar/* ~/.config/polybar/
mv ~/dot-system-BETA/config/i3/* ~/.config/i3/
mv ~/dot-system-BETA/config/rofi/* ~/.config/rofi/
mv ~/dot-system-BETA/config/picom/* ~/.config/picom/
mv ~/dot-system-BETA/config/(INSERT SHIT)/* ~/.config/(INSERT SHIT)/
shopt -u dotglob


