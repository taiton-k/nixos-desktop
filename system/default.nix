{ inputs, pkgs, ... } : {

        imports = [

                ./configuration.nix

                ./hardware-configuration.nix
                inputs.nixos-hardware.nixosModules.common-cpu-amd
                inputs.nixos-hardware.nixosModules.common-gpu-amd
                inputs.nixos-hardware.nixosModules.common-gpu-nvidia
                inputs.nixos-hardware.nixosModules.common-pc-laptop
                inputs.nixos-hardware.nixosModules.common-pc-ssd

                ./secureboot.nix
                inputs.lanzaboote.nixosModules.lanzaboote

                ./xremap.nix
                inputs.xremap.nixosModules.default
        ];
}
