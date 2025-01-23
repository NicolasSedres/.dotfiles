{
  wayland.windowManager.hyprland = {

    enable = true;

    xwayland.enable = true;

    settings = {
    	monitor = ["DP-1,1920x1080@144,0x0,1,mirror,HDMI-A-1"
		   "HDMI-A-1, 1024x768@60, auto-left,1"
		   ",preferred,auto,1"];

	workspace = ["1, monitor:DP-1"
		"2, monitor:DP-1"
		"3, monitor:DP-1"
		"4, monitor:DP-1"
		"5, monitor:DP-1"
		"6, monitor:HDMI-A-1"
		"7, monitor:HDMI-A-1"
		"8, monitor:HDMI-A-1" "9, monitor:HDMI-A-1"
		"0, monitor:HDMI-A-1"];
	exec-once = [
		"hyprpaper"
        "ckb-next -b"
        "waybar"
	];

	env = ["XCURSOR_SIZE,24"
		"LIBVA_DRIVER_NAME,nvidia"
		"XDG_SESSION_TYPE,wayland"
		"GBM_BACKEND,nvidia-drm"
		"__GLX_VENDOR_LIBRARY_NAME,nvidia"
		"WLR_NO_HARDWARE_CURSORS,1"];	
      
	 input = {
		kb_layout = "us";
		follow_mouse = 1;
		touchpad = {
		  natural_scroll = false;
		};
		sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
	      };

      "$mainMod" = "SUPER";

	bind = [
		"$mainMod, T, exec, kitty"
		"$mainMod SHIFT, Q, killactive"
		"$mainMod, E, exec, dolphin"
		"$mainMod SHIFT, F, fullscreen"
		# bind = $mainMod, V, togglefloating, 

		# Clipboard
		"$mainMod, V, exec, ~/.dotfiles/arch/scripts/cliphist.sh"

		#screenshot
		"$mainMod, PRINT, exec, ~/.dotfiles/arch/scripts/grim.sh"

		#rofi
		# Launcher
		"$mainMod, O, exec, ~/.config/rofi/launchers/type-1/launcher.sh"
		# Powermenu
		"$mainMod, escape, exec, ~/.config/rofi/powermenu/type-2/powermenu.sh"
		# Emoji
		"$mainMod, PERIOD, exec, ~/.config/rofi/emoji/type-1/emoji.sh"
		# Notes
		"$mainMod, N, exec, ~/.config/rofi/notes/notes.sh"
		# To-Do's
		"$mainMod, U, exec, ~/.config/rofi/todo/todo.sh"

		"$mainMod SHIFT, L, exec, swaylock"
		"$mainMod, P, pseudo" # dwindle
		"$mainMod, S, togglesplit" # dwindle

		# Move focus with mainMod + arrow keys
		"$mainMod, left, movefocus, l"
		"$mainMod, right, movefocus, r"
		"$mainMod, up, movefocus, u"
		"$mainMod, down, movefocus, d"
		"$mainMod, H, movefocus, l"
		"$mainMod, L, movefocus, r"
		"$mainMod, K, movefocus, u"
		"$mainMod, J, movefocus, d"

		# Move active window with mainMod + SHIFT + arrow keys
		"$mainMod SHIFT, H, movewindow, l"
		"$mainMod SHIFT, L, movewindow, r"
		"$mainMod SHIFT, K, movewindow, u"
		"$mainMod SHIFT, J, movewindow, d"

		# Resize active window with mainMod + CTRL + arrow keys
		"$mainMod CONTROL, H, resizeactive, -50 0"
		"$mainMod CONTROL, L, resizeactive, 50 0"
		"$mainMod CONTROL, K, resizeactive, 0 -50"
		"$mainMod CONTROL, J, resizeactive, 0 50"

		# Switch workspaces with mainMod + [0-9]
		"$mainMod, 1, workspace, 1"
		"$mainMod, 2, workspace, 2"
		"$mainMod, 3, workspace, 3"
		"$mainMod, 4, workspace, 4"
		"$mainMod, 5, workspace, 5"
		"$mainMod, 6, workspace, 6"
		"$mainMod, 7, workspace, 7"
		"$mainMod, 8, workspace, 8"
		"$mainMod, 9, workspace, 9"
		"$mainMod, 0, workspace, 10"

		# Move active window to a workspace with mainMod + SHIFT + [0-9]
		"$mainMod SHIFT, 1, movetoworkspace, 1"
		"$mainMod SHIFT, 2, movetoworkspace, 2"
		"$mainMod SHIFT, 3, movetoworkspace, 3"
		"$mainMod SHIFT, 4, movetoworkspace, 4"
		"$mainMod SHIFT, 5, movetoworkspace, 5"
		"$mainMod SHIFT, 6, movetoworkspace, 6"
		"$mainMod SHIFT, 7, movetoworkspace, 7"
		"$mainMod SHIFT, 8, movetoworkspace, 8"
		"$mainMod SHIFT, 9, movetoworkspace, 9"
		"$mainMod SHIFT, 0, movetoworkspace, 10"

		# Scroll through existing workspaces with mainMod + scroll
		"$mainMod, mouse_down, workspace, e+1"
		"$mainMod, mouse_up, workspace, e-1"

		# Next/previous workspace with Z and 
		"$mainMod, Z, workspace, -1"
		"$mainMod, X, workspace, +1"
	];
	bindm = [
		# Move/resize windows with mainMod + LMB/RMB and dragging
		"$mainMod, mouse:272, movewindow"
		"$mainMod, mouse:273, resizewindow"
	];
    };
  };
}
