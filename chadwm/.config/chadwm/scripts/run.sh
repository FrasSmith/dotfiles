#!/bin/sh

xrdb merge ~/.Xresources
xbacklight -set 10 &
xset r rate 500 100 &
setxkbmap -option compose:caps

picom &

dash ~/.config/chadwm/scripts/launchbar.sh &

dash ~/.config/chadwm/scripts/autostart.sh &

while type chadwm >/dev/null; do chadwm && continue || break; done
