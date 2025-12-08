{
    config,
    lib,
    pkgs,
    ...
}: {
    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
            xdg-desktop-portal-gnome
        ];
        config = {
            common = {
                default = ["gtk"];
            };
            niri = {
                default = ["gtk" "gnome"];
                "org.freedesktop.impl.portal.ScreenCast" = ["gnome"];
                "org.freedesktop.impl.portal.Screenshot" = ["gnome"];
            };
        };
    };

    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "application/pdf" = "mupdf.desktop";
            "video/mp4" = ["mpv.desktop"];
            "video/x-matroska" = ["mpv.desktop"];
            "video/x-msvideo" = ["mpv.desktop"];
            "video/webm" = ["mpv.desktop"];
            "x-scheme-handler/http" = ["librewolf.desktop"];
            "x-scheme-handler/https" = ["librewolf.desktop"];
            "image/*" = ["imv.desktop"];
        };
    };
}
