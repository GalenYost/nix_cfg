{
    config,
    lib,
    pkgs,
    ...
}: {
    xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
        extraPortals = with pkgs;
            lib.mkForce [
                xdg-desktop-portal-gnome
                xdg-desktop-portal-gtk
            ];
        config = {
            common = {
                default = ["gtk"];
            };
            niri = {
                default = ["gtk" "gnome"];
                "org.freedesktop.impl.portal.ScreenCast" = ["gtk"];
                "org.freedesktop.impl.portal.Screenshot" = ["gtk"];
                "org.freedesktop.impl.portal.Settings" = ["gnome"];
            };
        };
    };

    xdg.mime = {
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
