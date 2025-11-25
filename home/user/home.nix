{
    config,
    pkgs,
    lib,
    ...
}:

{
    imports = [
        ./yazi.nix
        ./nvim.nix
        ./i3.nix
        ./rofi.nix
        ./ghostty.nix
    ];

    services.udiskie = {
        enable = true;
        notify = false;
        tray = "never";
        settings = {
            program_options = {
                automount = true;
                file_manager = "yazi";
            };
        };
    };

    services.flameshot = {
        enable = true;
        settings = {
            General = {
                startupLaunch = true;
                showStartupLaunchMessage = false;
                disabledTrayIcon = true;
            };
        };
    };

    gtk = {
        enable = true;
        colorScheme = "dark";
        theme = {
            name = "Adwaita";
            package = pkgs.gnome-themes-extra;
        };
        iconTheme = {
            name = "Adwaita";
            package = pkgs.adwaita-icon-theme;
        };
        font.name = "SF Pro";
    };

    programs.tmux = {
        enable = true;
        keyMode = "vi";
        clock24 = true;
        shell = "${pkgs.bash}/bin/bash";
        mouse = true;
        shortcut = "b";
        baseIndex = 1;
        disableConfirmationPrompt = true;
    };

    home.stateVersion = "25.05";
    home.username = "user";
    home.homeDirectory = "/home/user";

    home.file = {
        "wallpaper.jpg" = {
            target = "/home/user/wallpaper.jpg";
            source = ./wallpaper.jpg;
        };
    };
}
