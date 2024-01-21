#!/bin/bash

# Define the path to the Hyprland configuration file
CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"

# Define the path for the backup file
BACKUP_FILE="$HOME/.config/hypr/hyprland.conf.backup"

# Create a backup of the original configuration file
cp "$CONFIG_FILE" "$BACKUP_FILE"

# Configuration lines to append
CONFIG_LINES="# trigger when the switch is turning off
bindl = , switch:off:Lid Switch,exec,hyprctl keyword monitor \"eDP-1, 2560x1440, 0x0, 1\"
# trigger when the switch is turning on
bindl = , switch:on:Lid Switch,exec,hyprctl keyword monitor \"eDP-1, disable\""

# Append configuration to the file
echo "$CONFIG_LINES" >> "$CONFIG_FILE"

# Optional: Display a confirmation message
echo "Configuration has been appended to $CONFIG_FILE"
echo "Backup of original configuration is saved as $BACKUP_FILE"

