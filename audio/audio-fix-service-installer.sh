#!/bin/bash

# Define paths
SCRIPT_SRC="necessary-verbs.sh"
SCRIPT_DEST="/usr/local/bin/necessary-verbs.sh"
SERVICE_SRC="audio-fix.service"
SERVICE_DEST="/etc/systemd/system/audio-fix.service"

# Ensure running as root
if [ "$EUID" -ne 0 ] && [ -z "$SUDO_USER" ]
  then echo "Please run as root"
  exit
fi

# Copy and set execute permissions for the script
cp "$SCRIPT_SRC" "$SCRIPT_DEST"
chmod +x "$SCRIPT_DEST"

# Replace the path in the service file to the new script path
sed -i "s|ExecStart=.*|ExecStart=$SCRIPT_DEST|" "$SERVICE_SRC"

# Copy the service file
cp "$SERVICE_SRC" "$SERVICE_DEST"

# Reload systemd and enable the service
systemctl daemon-reload
systemctl enable audio-fix.service
systemctl start audio-fix.service

echo "Audio fix installed and service started."

