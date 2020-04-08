#!/bin/sh

[ -z "$TERMINAL" ] && source ~/.profile

unclutter &
dunst &

# Adjust keyboard typematic delay and rate
xset r rate 300 50 &

# Start Xorg server at this DPI
xrandr --dpi 200 --output eDP-1 --scale 1.1x1.1&

# Merge & load configuration from .Xresources
xrdb -merge ~/.Xresources &

setbg &
python set_screen_brightness.py --set 50 &

bluetoothctl power on

# Let QT and GTK autodect retina screen and autoadjust
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GDK_SCALE=2
export GDK_DPI_SCALE=0.4

exec i3
