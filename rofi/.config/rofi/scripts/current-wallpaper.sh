#!/bin/bash
variety_output=$(variety --get)
file_path=(${variety_output//\n/ })
cp "$file_path" ~/.cache/current_wallpaper.jpg
