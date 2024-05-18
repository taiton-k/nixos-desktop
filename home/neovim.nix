{ lib, config, ... } :
	let
		cfg = config.modules.neovim;
	in {

	options.modules.neovim = {
		enable = lib.mkEnableOption "neovim";
	};

	config = lib.mkIf cfg.enable {
		programs.neovim = {
			enable = true;
			viAlias = true;
			vimAlias = true;
		};
	};
}
