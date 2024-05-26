{ pkgs, config, lib, inputs, ... } :
	let
		cfg = config.modules.wayland.hyprland;
		#hyprscroller = pkgs.callPackage ./hyprscroller.nix { inherit inputs; };
		hyprscroller = inputs.hyprscroller.packages.${pkgs.system}.default;
		hyprfocus = inputs.hyprfocus.packages.${pkgs.system}.default;
		hyprland-plugins = inputs.hyprland-plugins.packages.${pkgs.system};
	in {

	imports = [
		inputs.hyprland.homeManagerModules.default
	];

	options.modules.wayland = {
		hyprland = {
			enable = lib.mkEnableOption "hyprland";
		};
	};

	config = lib.mkIf cfg.enable {

		wayland.windowManager.hyprland = {

			enable = true;

			plugins = [
				hyprscroller
				hyprfocus
			];

			settings = {

				input = {
					kb_layout = "jp";
				};

				monitor = "eDP-1, 1920x1080, auto, 1";

				env = [
					 "NIXOS_OZONE_WL, 1"
					 # "WLR_NO_HARDWARE_CURSORS, 1"
				];

				exec-once = [
					"[workspace 1 silent] vivaldi"
					"[workspace 2 silent] foot"
					"[workspace 3 silent] foot"
					"mako"
				];



				general = {

					sensitivity = 1.5;

					gaps_in	= "10";
					gaps_out = "20";

					border_size = 0;
					"col.inactive_border" = "rgba(00000000)";
					"col.active_border" = "rgb(FFFFFF)";

					layout = "scroller";
				};

				decoration = {

					rounding = 8;
					inactive_opacity = 0.9;

					drop_shadow = true;
					shadow_range = 8;
					"col.shadow" = "rgba(ffffff66)";
					"col.shadow_inactive" = "rgba(1a1a1aee)";

					blur = {
						enabled = true;
						size = 3;
						passes = 3;
					};
				};

				bezier = [
					"easeOutSine, 0.61, 1, 0.88, 1"
					"easeOutQuad, 0.5, 1, 0.89, 1"
					"easeOutCubic, 0.33, 1, 0.68, 1"
					"easeInSine, 0.12, 0, 0.39, 0"
					"easeOutBack, 0.71, 1.38, 0.3, 1"
				];

				animation = [
					"global, 1, 4, default"
					"windowsIn, 1, 4, easeOutQuad, popin 80%"
					"windowsOut, 1, 20, easeOutQuad, popin"
					"windowsMove, 1, 3, easeOutQuad"
					"workspaces, 1, 4, easeOutBack, slidefade 20%"
					"fadeIn, 1, 3, easeInSine"
					"fadeOut, 1, 2, easeInSine"
				];

				plugin = {

					scroller = {
						column_default_width = "maximized";
					};

					hyprfocus = {
						enabled = "yes";
						animate_floating = "false";
						animate_workspacechange = "yes";
						focus_animation = "shrink";
						bezier = [
							"bezIn, 0.5,0.0,1.0,0.5"
							"bezOut, 0.0,0.5,0.5,1.0"
							"overshot, 0.05, 0.9, 0.1, 1.05"
							"smoothOut, 0.36, 0, 0.66, -0.56"
							"smoothIn, 0.25, 1, 0.5, 1"
							"realsmooth, 0.28,0.29,.69,1.08"
						];
						flash = {
							flash_opacity = 0.50;
							in_bezier = "realsmooth";
							in_speed = 0.5;
							out_bezier = "realsmooth";
							out_speed = 3;
						};
						shrink = {
							shrink_percentage = 0.95;
							in_bezier = "realsmooth";
							in_speed = 1;
							out_bezier = "realsmooth";
							out_speed = 2;
						};
					};
				};



				workspace = [
					"1, defaultName:browser, default:true, monitor:eDP-1, persistent:true"
					"2, defaultName:coding, persistent:true"
					"3, defaultName:terminal, persistent:true"
					"4, defaultName:game, persistent:true"
					"5, defaultName:others, persistent:true"
				];



				"$mod" = "WIN";

				bind = [
					"$mod, C, killactive"

					"$mod,       H, scroller:movefocus,  l"
					"$mod,       J, scroller:movefocus,  d"
					"$mod,       K, scroller:movefocus,  u"
					"$mod,       L, scroller:movefocus,  r"
					"$mod SHIFT, H, scroller:movewindow, l"
					"$mod SHIFT, J, scroller:movewindow, d"
					"$mod SHIFT, K, scroller:movewindow, u"
					"$mod SHIFT, L, scroller:movewindow, r"

					"$mod, Space, scroller:cyclesize, next"
					"$mod SHIFT, Space, scroller:cyclesize, prev"

					"$mod, Tab, scroller:toggleoverview"
					"$mod, Tab, submap, overview"
					"$mod, I, scroller:setmode, row"
					"$mod, O, scroller:setmode, column"
					"$mod, N, scroller:admitwindow"
					"$mod, M, scroller:expelwindow"

					"$mod, A, scroller:fitsize, active"
					"$mod, S, scroller:fitsize, visible"
					"$mod, D, scroller:fitsize, all"

					"$mod, Z, scroller:marksadd, mark"
					"$mod, X, scroller:marksvisit, mark"

					"$mod,      G, scroller:alignwindow, center"
					"$mod CTRL, G, scroller:alignwindow, center"
					"$mod CTRL, H, scroller:alignwindow, l"
					"$mod CTRL, J, scroller:alignwindow, d"
					"$mod CTRL, K, scroller:alignwindow, u"
					"$mod CTRL, L, scroller:alignwindow, r"

					"$mod, T, exec, foot"
					"$mod, V, exec, vivaldi"

					"$mod,       1, workspace,       1"
					"$mod,       2, workspace,       2"
					"$mod,       3, workspace,       3"
					"$mod,       Q, workspace,       4"
					"$mod,       W, workspace,       5"
					"$mod SHIFT, 1, movetoworkspace, 1"
					"$mod SHIFT, 2, movetoworkspace, 2"
					"$mod SHIFT, 3, movetoworkspace, 3"
					"$mod SHIFT, Q, movetoworkspace, 4"
					"$mod SHIFT, W, movetoworkspace, 5"
					"$mod CTRL, 1, movetoworkspacesilent, 1"
					"$mod CTRL, 2, movetoworkspacesilent, 2"
					"$mod CTRL, 3, movetoworkspacesilent, 3"
					"$mod CTRL, Q, movetoworkspacesilent, 4"
					"$mod CTRL, W, movetoworkspacesilent, 5"
				];
				bindm = [
					"$mod, mouse:272, movewindow"
					"$mod, mouse:273, resizewindow"
				];

				gestures = {
					workspace_swipe	= false;
					workspace_swipe_create_new = false;
					workspace_swipe_invert = false;
					workspace_swipe_min_speed_to_force = 0;
					workspace_swipe_cancel_ratio = 0.1;
				};
			};

			extraConfig = ''
				submap = overview
				bind = $mod, Tab, scroller:toggleoverview
				bind = $mod, Tab, submap, reset
				bind = $mod, H, scroller:movefocus, l
				bind = $mod, J, scroller:movefocus, d
				bind = $mod, K, scroller:movefocus, u
				bind = $mod, L, scroller:movefocus, r
				submap = reset
			'';
		};
	};
}
