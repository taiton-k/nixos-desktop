{
	imports = [
		./hyprland.nix
		./git.nix
	        ./alacritty.nix
                ./foot.nix
                ./vivaldi.nix
		./neovim.nix
	];

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
}
