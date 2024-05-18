{
        home = rec {
                username = "taiton";
                homeDirectory = "/home/${username}";
                stateVersion = "23.11";
        };

        programs = {
                home-manager = {
                        enable = true;
                };
        };



	imports = [
		../../home
	];

	modules = {

		foot = {
			enable = true;
		};

		git = {
			enable = true;
			userName = "taiton-k";
			userEmail = "84013946+taiton-k@users.noreply.github.com";
		};

		vivaldi = {
			enable = true;
		};

		neovim = {
			enable = true;
		};

		wayland = {
			enable = true;
			hyprland = {
			 	enable = true;
			};
			xremap = {
				enable = true;
			};
		};
	};
}
