#!/bin/zsh

picom &
unclutter &
sxhkd &
lxpolkit &
dunst &
xfce4-power-manager &

feh --no-fehbg --bg-fill ~/.config/wallpapers/background.jpg

~/.config/polybar/launch.sh &

