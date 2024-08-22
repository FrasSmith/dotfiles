#!/bin/sh

for pid in $(ps -ef | awk '/dobar.sh/ {print $2}'); do kill -9 $pid; done
sleep 1

~/.config/chadwm/scripts/dobar.sh &