#!/bin/bash

# Copy the rotation script to /usr/local/bin
cp auto-rotate.sh /usr/local/bin/
chmod +x /usr/local/bin/auto-rotate.sh

# Copy the systemd service file to /etc/systemd/system
cp auto-rotate.service /etc/systemd/system/

# Reload systemd to recognize new service
systemctl daemon-reload

# Enable the service to start on boot
systemctl enable auto-rotate.service

# Start the service
systemctl start auto-rotate.service

echo "Auto Rotate Service installed and started."
