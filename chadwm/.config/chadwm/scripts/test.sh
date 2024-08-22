#!/bin/bash

# Define a string
# uptime="15:15:32 up 1 day, 54 min,  2 users,  load average: 1.82, 1.10, 1.39"

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


