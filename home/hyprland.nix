{ pkgs, ... } : {

        home.packages = with pkgs; [
                swww
        ];

        wayland.windowManager.hyprland = {
                enable = true;
		settings = {
                        input = {
                                kb_layout = "jp";
                        };
                        monitor = ", 1920x1080, auto, 1";
                        env = [
                                 "NIXOS_OZONE_WL, 1"
				 "WLR_NO_HARDWARE_CURSORS, 1"
                        ];
                        "$mod" = "WIN";
                        exec-once = [
                                "vivaldi"
				"foot"
                        ];
                        bind = [
                                "$mod, T, exec, foot"
                                "$mod, V, exec, vivaldi"
				"$mod, Q, exit"
                        ];
		};
        };
}
