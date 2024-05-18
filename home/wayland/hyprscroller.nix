{ inputs, stdenv, cmake, pkg-config, hyprland, ... } : stdenv.mkDerivation {
	name = "hyprscroller";
	pname = "hyprscroller";
	src = inputs.hyprscroller;
	nativeBuildInputs = [
		cmake
		pkg-config
		hyprland
	] ++ hyprland.nativeBuildInputs;
	buildInputs = [ hyprland ] ++ hyprland.buildInputs;
	installPhase = ''
		mkdir -p $out/lib
		mv hyprscroller.so $out/lib/libhyprscroller.so
	'';
}
