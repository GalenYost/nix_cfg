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

    home.stateVersion = "25.05";
    home.username = "user";
    home.homeDirectory = "/home/user";

    home.packages = with pkgs; [
        telegram-desktop
        discord
        teams-for-linux
    ];

    home.file = {
        "wallpaper.jpg" = {
            target = "/home/user/wallpaper.jpg";
            source = ./wallpaper.jpg;
        };
    };
}
