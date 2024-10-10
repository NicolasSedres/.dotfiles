{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
    	monitor = ["DP-1,1920x1080@144,0x0,1"
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
	env = ["XCURSOR_SIZE,24"
		"LIBVA_DRIVER_NAME,nvidia"
		"XDG_SESSION_TYPE,wayland"
		"GBM_BACKEND,nvidia-drm"
		"__GLX_VENDOR_LIBRARY_NAME,nvidia"
		"WLR_NO_HARDWARE_CURSORS,1"];	
	exec-once = ["wl-paste --watch cliphist store"
		"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"];
	general = {
       	gaps_in = 5;
       	gaps_out = 20;
       	border_size = 3;
       	"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
       	"col.inactive_border" = "rgba(595959aa)";
       	layout = "dwindle";
      };
      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };
      
      master = {
        new_status = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = false;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };
        animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 16;
          passes = 2;
          new_optimizations = true;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

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
	misc = {
	disable_hyprland_logo = true;
	disable_splash_rendering = true;
	};

    };
  };
}
