#!/bin/bash
case $1 in
    d) cliphist list | rofi -dmenu -config ~/.config/rofi/launchers/type-1/style-8.rasi  | cliphist delete
       ;;

    w) if [ `echo -e "Clear\nCancel" | rofi -dmenu -config ~/.config/rofi/launchers/type-1/style-8.rasi` == "Clear" ] ; then
            cliphist wipe
       fi
       ;;

    *) cliphist list | rofi -dmenu -config ~/.config/rofi/launchers/type-1/style-8.rasi | cliphist decode | wl-copy
       ;;
esac
