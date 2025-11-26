{
    config,
    lib,
    pkgs,
    ...
}: {
    xdg.terminal-exec = {
        enable = true;
        settings = {
            GNOME = [
                "ghostty.desktop"
            ];
            default = ["ghostty.desktop"];
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
            "x-scheme-handler/http" = ["firefox.desktop"];
            "x-scheme-handler/https" = ["firefox.desktop"];
        };
    };

    xdg.mimeApps = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
        ];
        config = {
            common = {
                default = ["gtk"];
            };
        };
    };
}
