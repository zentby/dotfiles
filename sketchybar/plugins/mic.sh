#!/bin/bash

source "$CONFIG_DIR/colors.sh"
MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [[ $MIC_VOLUME -eq 0 ]]; then
  sketchybar -m --set mic icon="" icon.color="$RED"
else
  sketchybar -m --set mic icon="" icon.color="$WHITE"
fi
