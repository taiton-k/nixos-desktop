{ lib, config, pkgs, inputs, ... } :
	let
		cfg = config.modules.vivaldi;
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
