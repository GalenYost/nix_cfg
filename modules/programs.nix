{ config, lib, pkgs, ... }:

{
   programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
   };
   programs.sway = {
      enable = true;
      wrapperFeatures = {
         gtk = true;
      };
      xwayland.enable = true;
   };

   programs.xfconf.enable = true;

   systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
         flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      '';
  };
}
