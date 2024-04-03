{
        inputs = {

                nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

                home-manager = {
                        url = "github:nix-community/home-manager/release-23.11";
                        inputs.nixpkgs.follows = "nixpkgs";
                };

                lanzaboote = {
                        url = "github:nix-community/lanzaboote/v0.3.0";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
                
        };

        outputs = inputs : {

                nixosConfigurations = {
                        nixos-desktop = inputs.nixpkgs.lib.nixosSystem {
                                system = "x86_64-linux";
                                modules = [
                                        ./system/configuration.nix
                                        inputs.lanzaboote.nixosModules.lanzaboote
					./system/secureboot.nix
                                ];
                        };
                };

                homeConfigurations = {
                        nixos-desktop = inputs.home-manager.lib.homeManagerConfiguration {
                                pkgs = import inputs.nixpkgs {
                                        system = "x86_64-linux";
                                        config.allowUnfree = true;
                                };
                                extraSpecialArgs = {
                                        inherit inputs;
                                };
                                modules = [
                                        ./home/home.nix
                                ];

                        };
                };
        };
}

