{ pkgs, ... } : {
        home.packages = with pkgs; [
                vivaldi
                vivaldi-ffmpeg-codecs
		widevine-cdm
        ];
}
