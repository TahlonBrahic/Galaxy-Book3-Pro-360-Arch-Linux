#!/bin/bash

# Function to get the current orientation
get_orientation() {
    monitor-sensor | grep --line-buffered -oP 'Accelerometer orientation changed: \K.*' | while read -r line; do
        echo $line
        pkill -P $$ monitor-sensor
    done
}

# Get the primary screen output
SCREEN=$(wlr-randr | awk '/^[[:alnum:]]+-[[:digit:]]+/{display=$1} /Enabled: yes/{print display; exit}')
if [ -z "$SCREEN" ]; then
    echo "No active screen found."
    exit 1
fi

# Previous orientation
prev_orientation=""

while true; do
    # Get current orientation
    current_orientation=$(get_orientation)

    # Skip if orientation hasn't changed
    if [ "$current_orientation" = "$prev_orientation" ]; then
        continue
    fi

    prev_orientation=$current_orientation

    # Determine the transformation
    case "$current_orientation" in
    'normal')
        transformation='normal'
        ;;
    'left-up')
        transformation='90'
        ;;
    'right-up')
        transformation='270'
        ;;
    'bottom-up')
        transformation='180'
        ;;
    *)
        transformation='normal'  # Default case
        ;;
    esac

    # Apply the transformation
    wlr-randr --output "${SCREEN}" --transform "${transformation}"
    sleep 1  # Delay (adjust as necessary)
done

