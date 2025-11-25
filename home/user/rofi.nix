{
    config,
    pkgs,
    lib,
    ...
}:

{
    programs.rofi = {
        enable = true;
        location = "center";
        font = "JetBrainsMono Nerd Font 14";
        theme = let
            inherit (config.lib.formats.rasi) mkLiteral;
        in {
            "*" = {
                background = mkLiteral "#000000FF";
                background-alt = mkLiteral "#101010FF";
                foreground = mkLiteral "#FFFFFFFF";
                selected = mkLiteral "#62AEEFFF";
                active = mkLiteral "#98C379FF";
                urgent = mkLiteral "#E06B74FF";
            };
            "configuration" = {
                modi = "drun";
                case-sensitive = false;
                show-icons = true;
                cycle = true;
                filter = "";
                scroll-method = 0;
                display-drun = "";
                normalize-match = true;
                icon-theme = "Papirus";
                steal-focus = false;
                matching = "normal";
                tokenize = true;

                drun-categories = "";
                drun-match-fields = "name,generic,exec,categories,keywords";
                drun-display-format = "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
                drun-show-actions = false;
                drun-url-launcher = "xdg-open";
                drun-use-desktop-cache = false;
                drun-reload-desktop-cache = false;

                terminal = "ghostty";
                font = "Mono 12";
                sort = false;
                threads = 0;
                click-to-exit = true;
            };

            "window" = {
                transparency = "real";
                location = "center";
                anchor = "center";
                fullscreen = false;
                width = mkLiteral "700px";
                x-offset = mkLiteral "0px";
                y-offset = mkLiteral "0px";
                enabled = true;
                margin = mkLiteral "0px";
                padding = mkLiteral "0px";
                border = mkLiteral "0px solid";
                border-radius = mkLiteral "12px";
                border-color = mkLiteral "@selected";
                background-color = mkLiteral "@background";
                cursor = "default";
            };

            "mainbox" = {
                enabled = true;
                spacing = mkLiteral "10px";
                margin = mkLiteral "0px";
                padding = mkLiteral "20px";
                border = mkLiteral "0px solid";
                border-radius = mkLiteral "0px 0px 0px 0px";
                border-color = mkLiteral "@selected";
                background-color = mkLiteral "transparent";
                children = map mkLiteral [ "inputbar" "listview" ];
            };

            "inputbar" = {
                enabled = true;
                spacing = mkLiteral "10px";
                margin = mkLiteral "0px";
                padding = mkLiteral "15px";
                border = mkLiteral "0px solid";
                border-radius = mkLiteral "12px";
                border-color = mkLiteral "@selected";
                background-color = mkLiteral "@background-alt";
                text-color = mkLiteral "@foreground";
                children = map mkLiteral [ "prompt" "entry" ];
            };

            "prompt" = {
                enabled = true;
                background-color = mkLiteral "inherit";
                text-color = mkLiteral "inherit";
            };

            "textbox-prompt-colon" = {
                enabled = true;
                expand = false;
                str = "::";
                background-color = mkLiteral "inherit";
                text-color = mkLiteral "inherit";
            };

            "entry" = {
                enabled = true;
                background-color = mkLiteral "inherit";
                text-color = mkLiteral "inherit";
                cursor = "text";
                placeholder = "Search...";
                placeholder-color = mkLiteral "inherit";
            };

            "listview" = {
                enabled = true;
                columns = 2;
                lines = 8;
                cycle = true;
                dynamic = true;
                scrollbar = false;
                layout = "vertical";
                reverse = false;
                fixed-height = true;
                fixed-columns = true;
                spacing = mkLiteral "5px";
                margin = mkLiteral "0px";
                padding = mkLiteral "0px";
                border = mkLiteral "0px solid";
                border-radius = mkLiteral "0px";
                border-color = mkLiteral "@selected";
                background-color = mkLiteral "transparent";
                text-color = mkLiteral "@foreground";
                cursor = "default";
            };

            "scrollbar" = {
                handle-width = mkLiteral "5px";
                handle-color = mkLiteral "@selected";
                border-radius = mkLiteral "0px";
                background-color = mkLiteral "@background-alt";
            };

            "element" = {
                enabled = true;
                spacing = mkLiteral "10px";
                margin = mkLiteral "0px";
                padding = mkLiteral "5px";
                border = mkLiteral "0px solid";
                border-radius = mkLiteral "12px";
                border-color = mkLiteral "@selected";
                background-color = mkLiteral "transparent";
                text-color = mkLiteral "@foreground";
                cursor = "pointer";
            };

            "element normal.normal" = {
                background-color = mkLiteral "@background";
                text-color = mkLiteral "@foreground";
            };

            "element selected.normal" = {
                background-color = mkLiteral "@selected";
                text-color = mkLiteral "@background";
            };

            "element-icon" = {
                background-color = mkLiteral "transparent";
                text-color = mkLiteral "inherit";
                size = mkLiteral "32px";
                cursor = "inherit";
            };

            "element-text" = {
                background-color = mkLiteral "transparent";
                text-color = mkLiteral "inherit";
                highlight = mkLiteral "inherit";
                vertical-align = mkLiteral "0.5";
                horizontal-align = false;
                cursor = "inherit";
            };

            "error-message" = {
                padding = mkLiteral "15px";
                border = mkLiteral "2px solid";
                border-radius = mkLiteral "12px";
                border-color = mkLiteral "@selected";
                background-color = mkLiteral "@background";
                text-color = mkLiteral "@foreground";
            };

            "textbox" = {
                background-color = mkLiteral "@background";
                text-color = mkLiteral "@foreground";
                highlight = mkLiteral "none";
                vertical-align = mkLiteral "0.5";
                horizontal-align = false;
            };
        };
    };
}
