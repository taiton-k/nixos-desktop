{ pkgs, ... } : {

        wayland.windowManager.hyprland = {
                enable = true;
		settings = {
                        input = {
                                kb_layout = "jp";
                        };
                        monitor = "eDP-1, 1920x1080, auto, 1";
                        env = [
                                 "NIXOS_OZONE_WL, 1"
				 # "WLR_NO_HARDWARE_CURSORS, 1"
                        ];
                        "$mod" = "WIN";
                        exec-once = [
                                "vivaldi"
				"foot"
				"mako"
                        ];
                        decoration = {
                                rounding = 8;
                                inactive_opacity = 0.9;
                                drop_shadow = true;
                                shadow_range = 12;
                                blur = {
                                        enabled = true;
                                        size = 3;
					passes = 3;
                                };
                        };
			animation = [
                                "global, 1, 3, default"
			];
                        bind = [
                                "$mod, Space, fullscreen, 1"
                                "$mod, C, killactive"
                                "$mod, Tab, cyclenext"

                                "$mod, T, exec, foot"
                                "$mod, V, exec, vivaldi"
				"$mod, Q, exit"
                        ];
		};
        };
}
