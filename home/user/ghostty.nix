{
    config,
    pkgs,
    lib,
    ...
}:

{
    programs.ghostty = {
        enable = true;
        settings = {
            font-family = "Iosevka Nerd Font";
            font-size = 23;
            font-feature = "-calt, -liga, -dlig";
            working-directory = "/home/user/";
            mouse-hide-while-typing = true;
            mouse-scroll-multiplier = 1;
            confirm-close-surface = false;
            window-padding-balance = true;
            window-inherit-working-directory = false;
            window-decoration = "server";
            cursor-style = "block";
            cursor-style-blink = false;
            shell-integration = "none";
            theme = "TokyoNight Night";
        };
    };
}
