#!/bin/zsh

internal_monitor=eDP-1
external_monitor=DP-1

monitor_add() {
  desktops=5
  for desktop in $(bspc query -D --names -m $internal_monitor | sed "$desktops"q); do
    bspc desktop $desktop --to-monitor $external_monitor
  done

  bspc desktop Desktop --remove
  bspc wm -O $external_monitor $internal_monitor
}

monitor_remove() {
  bspc monitor $external_monitor -a Desktop

  for desktop in $(bspc query -D -m $external_monitor); do
    bspc desktop "$desktop" --to-monitor $internal_monitor
  done

  bspc desktop Desktop --remove
  bspc monitor $internal_monitor -o I II III IV V VI
}

if [[ $(xrandr -q | grep "$external_monitor disconnected") ]] then
  bspc monitor $internal_monitor -d I II III IV V VI

  xrandr --output $internal_monitor --primary --mode 3840x2160 --pos 0x0 --rotate normal --output $external_monitor --off

  if [[ $(bspc query -D -m $internal_monitor | wc -l) -ne 6 ]] then
    monitor_remove
  fi

  setxkbmap -option grp:rctrl_rshift_toggle us,gr -option ctrl:swapcaps &
  xrdb -merge ~/.config/.intern

  bspc wm -O $internal_monitor
else
  bspc monitor $external_monitor -d I II III IV V
  bspc monitor $internal_monitor -d VI VII VIII IX X

  xrandr --output $internal_monitor --mode 3840x2160 --pos 3840x1080 --output $external_monitor --primary --mode 3840x2160 --pos 0x0 --rotate normal

  if [[ $(bspc query -D -m $external_monitor | wc -l) -ne 5 ]] then
    monitor_add
  fi

  setxkbmap -option grp:rctrl_rshift_toggle us,gr &
  xrdb -merge ~/.config/.extern

  bspc wm -O $external_monitor $internal_monitor
fi
