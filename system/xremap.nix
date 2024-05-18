{ lib, config, inputs, ... } : 
	let
		cfg = config.modules.xremap;
	in {

	imports = [
		inputs.xremap.nixosModules.default
	];

	options.modules.xremap = {
		enable = lib.mkEnableOption "xremap";
	};

	config = lib.mkMerge [
		(lib.mkIf (!cfg.enable) {
			services.xremap.enable = false;
		})
		(lib.mkIf cfg.enable {

			services.xremap = {

				serviceMode = "system";

				config.modmap = [
					{
						name = "Change CapsLock to Ctrl";
						remap = {
							CapsLock = "Ctrl_L";
						};
						device = {
							only = "event2";
						};
					}
				];
			};

			services.udev.extraRules = ''
				KERNEL=="uinput", GROUP="input", TAG+="uaccess"
			'';
		})
	];
}
