{ lib, config, inputs, ... } :
	let
		cfg = config.modules.vivaldi;
		pkgs = import inputs.nixpkgs-for-vivaldi {
			system = "x86_64-linux";
			config.allowUnfree = true;
		};
	in {

	options.modules.vivaldi = {
		enable = lib.mkEnableOption "vivaldi";
	};
	
	config = lib.mkIf cfg.enable {
		home.packages = with pkgs; [
			vivaldi
			vivaldi-ffmpeg-codecs
			widevine-cdm
		];
	};
}
