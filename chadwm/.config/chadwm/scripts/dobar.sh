#!/bin/bash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/chadwm/scripts/bar_themes/gruvchad

cpu() {
  # cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)
  prefix=' '

  cpu_val=$(top -bn2 | grep '%Cpu' | tail -1 | grep -P '(....|...) id,'|awk '{print 100-$8 "%%"}')

  printf "^c$green^ $prefix $cpu_val"
}

pkg_updates() {
  # updates=$({ timeout 20 doas xbps-install -un 2>/dev/null || true; } | wc -l) # void
  # updates=$({ timeout 20 checkupdates 2>/dev/null || true; } | wc -l) # arch

  prefix="󰒃 "

  updates=$({ timeout 20 aptitude search '~U' 2>/dev/null || true; } | wc -l)

  if [ "$updates" -ge "1" ]; then
    printf "^c$green^  $prefix $updates"
  else
    printf ""
  fi
}

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
  printf "^c$blue^   $get_capacity"
}

brightness() {
  printf "^c$red^   "
  printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
}

mem() {
  printf "^c$blue^^b$black^  "
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

up() {
  prefix=" "
  upt=$( uptime -p )
  # Set the IFS (Internal Field Separator) to space
  IFS=' '
  # Use read to bash convert string to array
  read -ra uparray <<< "$upt"

  d=""
  h=""
  m=""
  index=0
  for i in ${uparray[@]}; do
      if [ $i == "minute" ] || [ $i == "minutes" ]; then
          m=${uparray[$((index-1))]}"m"
      fi
      if [ $i == "hour," ] || [ $i == "hours," ]; then
          h=${uparray[$((index-1))]}"h"
      fi
      if [ $i == "day," ] || [ $i == "days," ]; then
          d=${uparray[$((index-1))]}"d"
      fi
      index=$((index + 1))
  done

  printf "^c$blue^ $prefix $d $h $m"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^Connected" ;;
	down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected" ;;
	esac
}

clock() {
	# printf "^c$darkblue^ ^b$black^  󱑆 "
	printf "  ^c$white^ $(date '+%a, %b %e, %H:%M') "
}

cputemp() {
  # CPU_T=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon?/temp2_input)
  # CPU_TEMP=$(expr $CPU_T / 1000)
  prefix=' '
  fire=''
  warning=80

	cpu_temp="$(sensors | grep temp1 | awk 'NR==1{gsub("+", " "); gsub("\\..", " "); print $2}')"
	# cpu_temp=$CPU_TEMP

	if [ "$cpu_temp" -ge $warning ]; then
		prefix="$fire$prefix"
	fi

	printf "^c$red^ $prefix $cpu_temp°C"
}

nowplaying() {

  prefix=" "

  pgrep mocp > /dev/null || mocp -S

  state=$(mocp -Q %state)
  artist=$(mocp -Q %artist)
  song=$(mocp -Q %song)

  case $state in
	PLAY) track="$prefix $artist, $song" ;;
	PAUSE) track=" " ;;
	esac

	printf "^c$orange^ $track"
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(nowplaying) $(up) $updates $(cpu) $(cputemp) $(clock)"
done
