{
    config,
    pkgs,
    lib,
    ...
}: {
    programs.fastfetch = {
        enable = true;
        settings = {
            "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
            "logo" = {
                "padding" = {
                    "top" = 0;
                    "left" = 1;
                    "right" = 2;
                };
            };
            "display" = {
                "separator" = " ";
            };
            "modules" = [
                {
                    "type" = "title";
                    "format" = "{user-name-colored}@{host-name-colored}";
                }
                {
                    "type" = "os";
                    "key" = "OS:";
                }
                {
                    "type" = "kernel";
                    "key" = "Kernel:";
                }
                {
                    "type" = "uptime";
                    "key" = "Uptime:";
                }
                {
                    "type" = "packages";
                    "key" = "Packages:";
                    "format" = "{all}";
                }
                {
                    "type" = "wm";
                    "key" = "WM:";
                }
                {
                    "type" = "wmtheme";
                    "key" = "Theme:";
                }
                {
                    "type" = "display";
                    "key" = "Display:";
                }
                {
                    "type" = "shell";
                    "key" = "Shell:";
                }
                {
                    "type" = "terminalfont";
                    "key" = "Font:";
                }
                {
                    "type" = "cpu";
                    "key" = "CPU:";
                }
                {
                    "type" = "gpu";
                    "key" = "GPU:";
                }
                {
                    "type" = "memory";
                    "key" = "Memory:";
                }
                {
                    "type" = "disk";
                    "key" = "Disk (/):";
                    "folders" = "/";
                }
                {
                    "type" = "custom";
                    "key" = "\n\n\n";
                }
                {
                    "type" = "colors";
                    "key" = " ";
                    "symbol" = "cube";
                }
            ];
        };
    };
}
