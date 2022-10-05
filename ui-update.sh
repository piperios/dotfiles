#!/usr/bin/env bash
feh --bg-fill ~/.config/wallpapers/background.jpg
[ -x ~/.config/polybar/launch.sh ] && ~/.config/polybar/launch.sh &
