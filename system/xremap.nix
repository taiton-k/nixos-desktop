{
        services.xremap = {
                userName = "taiton";
                serviceMode = "system";
                config = {
                        modmap = [
                                {
                                        name = "Change CapsLock to Ctrl";
                                        remap = {
                                                CapsLock = "Ctrl_L";
                                        };
                                        device = {
                                                only = "event2";
                                        };
                                }
                        ];
                        keymap = [
                                {
                                        name = "Emacs keybind";
                                        remap = {
                                                C-h = "BackSpace";
                                                C-d = "Delete";
                                                C-b = "Left";
                                                C-f = "Right";
                                                C-p = "Up";
                                                C-n = "Down";
                                        };
                                        application = {
                                                not = "foot";
                                        };
                                }
                        ];
                };
        };
}
