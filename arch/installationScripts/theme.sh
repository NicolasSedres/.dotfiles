#!/bin/sh

cp -r /home/kenshin/.config/gtk-3.0/themes/Material-Black-Cherry /usr/share/themes/Material-Black-Cherry
cp -r /home/kenshin/.config/gtk-3.0/icons/Cherry-Numix-2021 /usr/share/icons/Cherry-Numix-2021

# usage: import-gsettings
config="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini"
if [ ! -f "$config" ]; then exit 1; fi

gnome_schema="org.gnome.desktop.interface"
gtk_theme="$(grep 'gtk-theme-name' "$config" | sed 's/.*\s*=\s*//')"
icon_theme="$(grep 'gtk-icon-theme-name' "$config" | sed 's/.*\s*=\s*//')"
echo $gtk_theme
echo $icon_theme
# cursor_theme="$(grep 'gtk-cursor-theme-name' "$config" | sed 's/.*\s*=\s*//')"
# font_name="$(grep 'gtk-font-name' "$config" | sed 's/.*\s*=\s*//')"
gsettings set "$gnome_schema" gtk-theme "$gtk_theme"
gsettings set "$gnome_schema" icon-theme "$icon_theme"
# gsettings set "$gnome_schema" cursor-theme "$cursor_theme"
# gsettings set "$gnome_schema" font-name "$font_name"
