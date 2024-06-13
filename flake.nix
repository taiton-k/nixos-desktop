{
	outputs = inputs @ { flake-parts, ... } :
		flake-parts.lib.mkFlake { inherit inputs; } {

			systems = [
				"x86_64-linux"
			];

			imports = [
				./profiles
				./hosts
			];
		};

        inputs = {

                nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		flake-parts.url = "github:hercules-ci/flake-parts";

                home-manager = {
                        url = "github:nix-community/home-manager";
                        inputs.nixpkgs.follows = "nixpkgs";
                };



		nixos-hardware.url = "github:NixOS/nixos-hardware/master";

                lanzaboote = {
                        url = "github:nix-community/lanzaboote/v0.3.0";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
                
		xremap.url = "github:xremap/nix-flake";



		nixpkgs-for-vivaldi.url = "github:NixOS/nixpkgs/e89cf1c932006531f454de7d652163a9a5c86668";

		hyprland = {
			url = "git+https://github.com/hyprwm/Hyprland?submodules=1&ref=v0.41.0&rev=ea2501d4556f84d3de86a4ae2f4b22a474555b9f";
		};

		hyprland-plugins = {
			url = "github:hyprwm/hyprland-plugins";
			inputs.hyprland.follows = "hyprland";
		};

		hyprscroller = {
			url = "github:dawsers/hyprscroller";
			inputs.hyprland.follows = "hyprland";
		};

		hyprfocus = {
			url = "github:pyt0xic/hyprfocus";
			inputs.hyprland.follows = "hyprland";
		};
        };
}
