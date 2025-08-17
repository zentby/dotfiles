#!/bin/bash

# 麦克风
mic=(
  update_freq=3
  script="$PLUGIN_DIR/mic.sh"
  click_script="$PLUGIN_DIR/mic_click.sh"
  label.drawing=off
  icon.align=center
  icon.padding_left=8
  icon.padding_right=8
  padding_left=0
  padding_right=0
  background.drawing=off
)

sketchybar --add item mic right \
           --set mic "${mic[@]}" \
           --subscribe mic volume_change
