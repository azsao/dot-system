#!/bin/bash

USER_HOME=$(getent passwd "$(whoami)" | cut -d: -f6)

# move dot files config
shopt -s dotglob
mv $USER_HOME/dot-system-main/config/polybar/* $USER_HOME/.config/polybar/
mv $USER_HOME/dot-system-main/config/i3/* $USER_HOME/.config/i3/
mv $USER_HOME/dot-system-main/config/rofi/* $USER_HOME/.config/rofi/
mv $USER_HOME/dot-system-main/config/picom/* $USER_HOME/.config/picom/
shopt -u dotglob


