{ lib, config, inputs, ... } :
	let 
		cfg = config.modules.wayland.xremap;
	in {

	imports = [
		inputs.xremap.homeManagerModules.default
	];

	options.modules.wayland.xremap = {
		enable = lib.mkEnableOption "xremap";
	};

	config = lib.mkMerge [
		(lib.mkIf (!cfg.enable) {
			services.xremap.enable = false;
		})
		(lib.mkIf cfg.enable {
			services.xremap = {
				withWlroots = true;
				deviceNames = [
					"xremap"
				];
				config.keypress_delay_ms = 20;
				config.keymap = [
					{
						name = "Emacs keybind";
						remap = {
							C-h = "BackSpace";
							C-d = "Delete";
							C-b = "Left";
							C-f = "Right";
							C-p = "Up";
							C-n = "Down";
						};
						application.not = [
							"foot"
						];
					}
				];
			};
		})
	];
}
