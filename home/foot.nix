{ lib, config, ... } :
	let
		cfg = config.modules.foot;
	in {

	options.modules.foot = {
		enable = lib.mkEnableOption "foot";
	};

	config = lib.mkIf cfg.enable {

		programs.foot = {

			enable = true;

			server.enable = true;

			settings = {
				main = {
					font = "PlemolJP Console NF:size=12";
				};
				colors = {
					alpha = 0.8;
				};
			};
		};
	};
}
