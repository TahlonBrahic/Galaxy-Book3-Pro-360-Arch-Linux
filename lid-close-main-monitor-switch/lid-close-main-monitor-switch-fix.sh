#!/bin/bash
#Inspired by https://www.reddit.com/r/hyprland/comments/11lpxcq/config_to_turn_off_main_laptop_display_when/

# Define the path to the Hyprland configuration file
CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"

# Configuration lines to append
CONFIG_LINES="# trigger when the switch is turning off
bindl = , switch:off:Lid Switch,exec,hyprctl keyword monitor \"eDP-1, 2560x1440, 0x0, 1\"
# trigger when the switch is turning on
bindl = , switch:on:Lid Switch,exec,hyprctl keyword monitor \"eDP-1, disable\""

# Append configuration to the file
echo "$CONFIG_LINES" >> "$CONFIG_FILE"

# Optional: Display a confirmation message
echo "Configuration has been appended to $CONFIG_FILE"

