#!/bin/zsh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -q primary -c ~/.config/polybar/config.ini &
if [[ $(xrandr -q | grep "DP-1 connected") ]] then
  polybar -q secondary -c ~/.config/polybar/config.ini &
fi
