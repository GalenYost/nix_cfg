{
  config,
  pkgs,
  lib,
  ...
}:

{
    programs.niri.enable = true;
    services.greetd = {
        enable = true;
        settings.default_session = {
            command = "niri-session";
            user = "user";
        };
    };

    qt = {
        enable = true;
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
    ];
}
