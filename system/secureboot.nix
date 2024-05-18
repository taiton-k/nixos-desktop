{ pkgs, lib, config, inputs, ... } :
	let
		cfg = config.modules.secureboot;
	in {



	imports = [
		inputs.lanzaboote.nixosModules.lanzaboote
	];



	options.modules.secureboot = {
		enable = lib.mkEnableOption "secureboot";
	};



	config = lib.mkIf cfg.enable {

		environment.systemPackages = [
			pkgs.sbctl
		];

		boot.loader.systemd-boot.enable = lib.mkForce false;

		boot.lanzaboote = {
			enable = true;
			pkiBundle = "/etc/secureboot";
		};
	};
}
