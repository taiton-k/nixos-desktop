{ pkgs, ... } : {

        imports = [
                ./hyprland.nix
        ];

        home.packages = with pkgs; [
                swww
                mako
		hyprlock
        ];
}
