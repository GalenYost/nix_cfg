{
    config,
    pkgs,
    lib,
    ...
}: {
    services.xserver = {
        enable = true;
        autorun = true;
        windowManager.i3.enable = true;
        xkb = {
            options = "grp:alt_shift_toggle";
            layout = "us,ua,ru";
        };
    };
    services.displayManager = {
        autoLogin = {
            enable = true;
            user = "user";
        };
        defaultSession = "none+i3";
    };

    qt = {
        enable = true;
        style = "adwaita-dark";
    };

    environment.sessionVariables = {
        GTK_THEME = "Adwaita:dark";
        XDG_SESSION_TYPE = "x11";
        QT_QPA_PLATFORM = "xcb";
    };
}
