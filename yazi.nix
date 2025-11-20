{
  config,
  pkgs,
  lib,
  ...
}:

{
    programs.yazi = {
        enable = true;
        settings.yazi = {
            mgr.show_hidden = true;
            opener = {
                play = [
                    { run = "mpv $@"; orphan = true; for = "unix"; desc = "Play"; }
                ];
                edit = [
                    { run = "nvim $@"; block = true; for = "unix"; desc = "Edit"; }
                ];
                open = [
                    { run = "xdg-open $@"; desc = "Open"; }
                ];
                office = [
                    { run = "onlyoffice-desktopeditors --view=$@"; desc = "Open office"; }
                ];
            };
            open = {
                rules = [
                    { mime = "audio/*"; use = "play"; }
                    { mime = "video/*"; use = "play"; }
                    { mime = "x-scheme-handler/*"; use = "open"; }
                    { mime = "text/*"; use = "open"; }
                    { mime = "application/pdf"; use = "open"; }
                    { name = "*.{docx,pptx,xlsx,xlsm}"; use = "office"; }
                ];
            };
        };
    };
}
