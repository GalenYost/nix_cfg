{
    config,
    pkgs,
    lib,
    ...
}: {
    programs.yazi = {
        enable = true;
        settings.yazi = {
            mgr.show_hidden = true;
            opener = {
                play = [
                    {
                        run = "mpv $@";
                        desc = "Play";
                        orphan = true;
                    }
                ];
                edit = [
                    {
                        run = "nvim $@";
                        desc = "Edit";
                        block = true;
                        orphan = true;
                    }
                ];
                open = [
                    {
                        run = "xdg-open $@";
                        desc = "Open";
                        orphan = true;
                    }
                ];
                office = [
                    {
                        run = "onlyoffice-desktopeditors --view=$@";
                        desc = "Open office";
                        orphan = true;
                    }
                ];
            };
            open = {
                rules = [
                    {
                        mime = "audio/*";
                        use = "play";
                    }
                    {
                        mime = "video/*";
                        use = "play";
                    }
                    {
                        mime = "x-scheme-handler/*";
                        use = "open";
                    }
                    {
                        mime = "text/*";
                        use = "open";
                    }
                    {
                        name = "*.{docx,pptx,xlsx,xlsm,doc}";
                        use = "office";
                    }
                ];
            };
        };
    };
}
