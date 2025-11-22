{ config, pkgs, lib, ... }:

{
    imports = [
        ./yazi.nix
    ];

    services.udiskie.enable = true;

    # home.pointerCursor = {
    #     name = "Adwaita";
    #     package = pkgs.adwaita-icon-theme;
    # };

    home.stateVersion = "25.05";
    home.username = "user";
    home.homeDirectory = "/home/user";

    home.file = {
        ".bashrc".source = ./configs/.bashrc;
        ".tmux.conf".source = ./configs/.tmux.conf;

        ".config/nvim" = {
            source = ./configs/nvim;
            recursive = true;
        };
        ".config/gtk-3.0".source = ./configs/gtk-3.0;
        ".config/gtk-4.0".source = ./configs/gtk-3.0;
        ".config/niri".source = ./configs/niri;
        ".config/i3".source = ./configs/i3;
        ".config/rofi".source = ./configs/rofi;
        ".config/ghostty".source = ./configs/ghostty;
        ".config/flameshot".source = ./configs/flameshot;

        "wallpaper.jpg" = {
            target = "/home/user/wallpaper.jpg";
            source = ./configs/wallpaper.jpg;
        };
    };
}
