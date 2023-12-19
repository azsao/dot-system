#!/bin/sh

# specify variables 
ERROR_MSG = “ERROR: Specified directory not found”
USER = ‘whoami’

sleep 2

OUTDATED = (${USER}/.config/polybar, ${USER}/.config/rofi, .${USER}/config/i3, ${USER}/.config/insertname) 

# list of functions
if $OUTDATED -d
rmdir $OUTDATED
else 
echo “$ERROR_MSG”
fi 

Echo “imp.sh executed successfully, proceeding”
