{ pkgs, ... } : {
        programs.foot = {
                enable = true;
                server.enable = true;
		settings = {
                        main = {
                                font = "PlemolJP Console NF:size=12";
                        };
                };
        };
}

