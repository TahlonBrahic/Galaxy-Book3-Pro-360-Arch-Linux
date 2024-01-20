#!/bin/bash

get_orientation() {
    timeout 2 monitor-sensor | grep --line-buffered -oP 'Accelerometer orientation changed: \K.*' | tail -1
}

set_orientation() {
    local orientation=$1
    local transformation
    case "$orientation" in
        'normal') transformation='normal' ;;
        'left-up') transformation='90' ;;
        'right-up') transformation='270' ;;
        'bottom-up') transformation='180' ;;
        *) transformation='normal' ;;
    esac

    local screen=$(wlr-randr | awk '/^[[:alnum:]]+-[[:digit:]]+/{display=$1} /Enabled: yes/{print display; exit}')
    
    if [ -n "$screen" ]; then
        wlr-randr --output "$screen" --transform "$transformation"
    else
        echo "No active screen found."
    fi
}

while true; do
    orientation=$(get_orientation)
    if [ -n "$orientation" ]; then
        set_orientation "$orientation"
    fi
    sleep 1
done

