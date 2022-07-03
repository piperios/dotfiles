#!/usr/bin/env bash
feh --bg-fill ~/.config/background.jpg
[ -x ~/.config/polybar/launch.sh ] && ~/.config/polybar/launch.sh &
