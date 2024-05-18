{ inputs, ... } : {
	
	flake.nixosConfigurations.victus-laptop = inputs.nixpkgs.lib.nixosSystem {

		system = "x86_64-linux";

		specialArgs = {
			inherit inputs;
		};

		modules = [
			./configuration.nix
			./hardware-configuration.nix
			./module-configuration.nix
		];
	};
}
