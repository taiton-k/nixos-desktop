{ pkgs, config, lib, ... } :
	let
		cfg = config.modules.wayland;
	in {

        imports = [
                ./hyprland.nix
		./xremap.nix
        ];

	options.modules.wayland = {
		enable = lib.mkEnableOption "wayland";
	};

	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [
			swww
			mako
			hyprlock
		];
	};
}
