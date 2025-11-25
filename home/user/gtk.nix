{
    config,
    pkgs,
    lib,
    ...
}: {
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
    };
}
