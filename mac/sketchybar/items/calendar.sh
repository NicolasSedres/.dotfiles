#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon=􀧞  \
                          label.color=$BRGREEN \
                          update_freq=1 \
                          script="$PLUGIN_DIR/calendar.sh"
