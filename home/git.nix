{ pkgs, ... } : {

        programs = {

                git = {
                        enable = true;
                        userName = "taiton-k";
                        userEmail = "84013946+taiton-k@users.noreply.github.com";
                };

                lazygit = {
                        enable = true;
                };
        };
}
