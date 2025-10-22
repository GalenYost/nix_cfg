{
  config,
  lib,
  pkgs,
  ...
}:

{
  xdg.terminal-exec = {
    enable = true;
    settings = {
      GNOME = [
        "foot.desktop"
      ];
      default = [ "foot.desktop" ];
    };
  };
  xdg.portal.xdgOpenUsePortal = true;

  xdg.mime = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "mupdf.desktop";
      "video/mp4" = [ "mpv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "video/x-msvideo" = [ "mpv.desktop" ];
      "video/webm" = [ "mpv.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
    };
  };
}
