{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.niri.enable = true;

  qt = {
    enable = true;
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
