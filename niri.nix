{
    config,
    pkgs,
    lib,
    inputs,
    ...
}: {
    programs.niri = {
        enable = true;
        package = inputs.niri.packages.${pkgs.system}.niri;
    };
    services.greetd = {
        enable = true;
        settings.default_session = {
            command = "niri-session";
            user = "user";
        };
    };

    qt = {
        enable = true;
        platformTheme = "gnome";
        style = "adwaita-dark";
    };

    environment.sessionVariables = {
        GTK_THEME = "Adwaita:dark";
        XDG_CURRENT_DESKTOP = "niri";
        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP = "niri";
    };

    environment.systemPackages = with pkgs; [
        gnome-keyring
        swww
        xwayland-satellite
        wl-clipboard-rs
    ];
}
