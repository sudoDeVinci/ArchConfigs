#!/bin/bash

OUTPUT="eDP-1"
HEIGHT=1280
WIDTH=1920
REFRESH=60
MODE_NAME="${WIDTH}x${HEIGHT}_${REFRESH}.00"

# Remove quotes from the modeline to avoid quoting issues
MODELINE=$(cvt $WIDTH $HEIGHT $REFRESH | grep Modeline | sed 's/Modeline //' | tr -d '"')

if ! xrandr | grep -q "$MODE_NAME"; then
    xrandr --newmode $MODELINE
    xrandr --addmode $OUTPUT "$MODE_NAME"
fi

xrandr --output $OUTPUT --mode "$MODE_NAME"