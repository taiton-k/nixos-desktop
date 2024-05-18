{ lib, config, ... } :
	let
		cfg = config.modules.git;
	in {

	options.modules.git = {

		enable = lib.mkEnableOption "git";

		userName = lib.mkOption {
			type = lib.types.str;
		};

		userEmail = lib.mkOption {
			type = lib.types.str;
		};
	};

	config = lib.mkIf cfg.enable {

		programs = {

			git = {
				enable = true;
				userName = cfg.userName;
				userEmail = cfg.userEmail;
			};

			lazygit = {
				enable = true;
			};
		};
	};
}
