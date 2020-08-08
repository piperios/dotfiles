xmodmap -e "pointer = 1 2 3"
xrdb -merge ~/.Xresources
~/.screenlayout/default.sh
exec /usr/bin/xmonad
