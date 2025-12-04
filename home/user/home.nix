{
    config,
    pkgs,
    lib,
    ...
}: {
    imports = [
        ./yazi.nix
        ./nvim.nix
        ./i3.nix
        ./rofi.nix
        ./ghostty.nix
        ./fastfetch.nix
        ./udiskie.nix
        ./flameshot.nix
        ./gtk.nix
        ./tmux.nix
        ./xdg.nix
    ];

    qt = {
        enable = true;
        platformTheme.name = "adwaita";
        style = {
            name = "adwaita-dark";
            package = pkgs.adwaita-qt;
        };
    };

    home.pointerCursor = {
        name = "Adwaita";
        size = 22;
        package = pkgs.adwaita-icon-theme;
    };

    home.stateVersion = "25.11";
    home.username = "user";
    home.homeDirectory = "/home/user";

    home.packages = with pkgs; [
        telegram-desktop
        discord
        teams-for-linux
    ];

    home.file = {
        ".config/niri".source = ./niri;
        "wallpaper.jpg" = {
            target = "/home/user/wallpaper.jpg";
            source = ./wallpaper.jpg;
        };
    };
}
