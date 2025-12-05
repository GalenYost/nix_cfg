{
    config,
    pkgs,
    lib,
    ...
}: {
    programs.yazi = {
        enable = true;
        plugins = with pkgs; {
            mount = yaziPlugins.mount;
        };
        flavors = {
            tokyonight = ./tokyo-night.yazi;
        };
        theme.flavor.dark = "tokyonight";
        keymap = {
            mgr.prepend_keymap = [
                {
                    run = "remove --permanently --hovered";
                    on = ["d"];
                }
                {
                    run = "plugin mount";
                    on = ["M"];
                }
            ];
        };
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
