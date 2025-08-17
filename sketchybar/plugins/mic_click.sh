#!/bin/bash

source "$CONFIG_DIR/colors.sh"
MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [[ $MIC_VOLUME -eq 0 ]]; then
  osascript -e 'set volume input volume 100'
  sketchybar -m --set mic icon="" icon.color="$RED"
else
  osascript -e 'set volume input volume 0'
  sketchybar -m --set mic icon= icon.color="$WHITE"
fi 
