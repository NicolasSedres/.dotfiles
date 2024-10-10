{
programs.kitty = {
	enable = true;
	font.name = "JetBrainsMono Nerd Font Mono";
	settings = {
		background_opacity = "0.7";
		active_border_color = "white";
		inactive_border_color = "#600203";
		inactive_tab_background = "#090c0c";
		tab_bar_style = "powerline";
		active_tab_background = "#DB4740";
		inactive_tab_foreground = "#DB4740";
		tab_bar_margin_color = "#090c0c";
	};
	keybindings = {
			# window management
			"ctrl+shift+s" = "new_window_with_cwd";
			"ctrl+shift+d" = "close_window";
			"ctrl+shift+m" = "toggle_layout stack";
			# VIM LIKE MOVEMENT
			"ctrl+shift+h" = "neighboring_window left";
			"ctrl+shift+j" = "neighboring_window down";
			"ctrl+shift+k" = "neighboring_window up";
			"ctrl+shift+l" = "neighboring_window right";

			"shift+up" = "move_window up";
			"shift+left" = "move_window left";
			"shift+right" = "move_window right";
			"shift+down" = "move_window down";

			"ctrl+shift+left" = "resize_window narrower";
			"ctrl+shift+right" = "resize_window wider";
			"ctrl+shift+up" = "resize_window taller";
			"ctrl+shift+down" = "resize_window shorter 3";
			# reset all windows in the tab to default sizes
			"ctrl+shift+r" = "resize_window reset";
			# tabs management
			"ctrl+alt+s" = "new_tab";
			"ctrl+alt+h" = "previous_tab";
			"ctrl+alt+l" = "next_tab";
			"ctrl+alt+d" = "close_tab";
			"ctrl+alt+shift+l" = "move_tab_forward";
			"ctrl+alt+shift+h" = "move_tab_backward";
	};
};
}
