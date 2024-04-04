{ inputs, config, lib, pkgs, ... } : {

        system.stateVersion = "23.11";


        nix = {
                settings = {
                        auto-optimise-store = true;
                        experimental-features = ["nix-command" "flakes"];
                };
                gc = {
                        automatic = true;
                        dates = "weekly";
                        options = "--delete-older-than 7d";
                };
        };

        nixpkgs.config.allowUnfree = true;


        boot = {
                loader = {
                        # systemd-boot.enable = true;
                        efi.canTouchEfiVariables = true;
                };
                kernelPackages = pkgs.linuxKernel.packages.linux_zen;
        };


	hardware = {
	        opengl = {
                        enable = true;
                };
                nvidia = {
                        prime = {
                                amdgpuBusId = "PCI:6:0:0";
                                nvidiaBusId = "PCI:1:0:0";
                        };
                };
        };


	networking = {
                networkmanager.enable = true;
                hostName = "nixos-desktop";
	};


        console.keyMap = "jp106";

	i18n.defaultLocale = "ja_JP.UTF-8";


	zramSwap = {
	        enable = true;
                memoryPercent = 200;
	};

        swapDevices = [{
                device = "/swapfile";
                size = 16 * 1024;
        }];


        sound.enable = true;

        hardware.pulseaudio.enable = false;
        security.rtkit.enable = true;
        services.pipewire = {
                enable = true;
                alsa.enable = true;
                alsa.support32Bit = true;
                jack.enable = true;
                pulse.enable = true;
        };


        programs = {
                fish = {
                        enable = true;
                };
                git = {
                        enable = true;
                };
                neovim = {
                        enable = true;
                        defaultEditor = true;
                        viAlias = true;
                        vimAlias = true;
                };
        };


        users.defaultUserShell = pkgs.fish;

        services.dbus.enable = true;
        xdg.portal = {
                enable = true;
                wlr.enable = true;
                config.common.default = [
                        "wlr"
                ];
        };


        fonts = {
                packages = with pkgs; [
                        ibm-plex
                        twemoji-color-font
                        "${ pkgs.fetchzip {
                                url = "https://github.com/yuru7/PlemolJP/releases/download/v1.7.1/PlemolJP_v1.7.1.zip";
                                hash = "sha256-YH1c/2jk8QZNyPvzRZjxNHyNeci9tjn+oOW8xLd8kjk=";
                        }}"
                        "${ pkgs.fetchzip {
                                url = "https://github.com/yuru7/PlemolJP/releases/download/v1.7.1/PlemolJP_HS_v1.7.1.zip";
                                hash = "sha256-JbuKBU1TT0qE89N61jX+WF25PBRHo/RSAtdPa5Ni8og=";
                        }}"
                        "${ pkgs.fetchzip {
                                url = "https://github.com/yuru7/PlemolJP/releases/download/v1.7.1/PlemolJP_NF_v1.7.1.zip";
                                hash = "sha256-nxGvaHLs65z4CSy/smy+koQyuYcDXJKjPZt5NusUN3E=";
                        }}"
                ];
                fontconfig = {
                        defaultFonts = {
                                serif = [
                                        "IBM Plex Serif"
                                        "PlemolJP HS"
                                        "Twitter Color Emoji"
                                ];
                                sansSerif = [
                                        "IBM Plex Sans"
                                        "PlemolJP HS"
                                        "Twitter Color Emoji"
                                ];
                                monospace = [
                                        "PlemolJP Console NF"
                                        "Twitter Color Emoji"
                                ];
                                emoji = [
                                        "Twitter Color Emoji"
                                ];
                        };
                };
        };


        users.users.taiton = {
                createHome = true;
                home = "/home/taiton";
                isNormalUser = true;
                extraGroups = [ "wheel" "networkmanager" ];
        };
}
