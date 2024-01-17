#!/bin/bash

# Automatically find the primary (active) screen output
SCREEN=$(wlr-randr | awk '/^[[:alnum:]]+-[[:digit:]]+/{display=$1} /Enabled: yes/{print display; exit}')


if [ -z "$SCREEN" ]; then
    echo "No active screen found."
    exit 1
fi

case "$1" in
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
    echo "Invalid rotation: $1"
    exit 1
esac

wlr-randr --output "${SCREEN}" --transform "${transformation}"

