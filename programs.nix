{ config, lib, pkgs, ... }:

{
   programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
   };

   programs.xfconf.enable = true;
   programs.thunar.enable = true;
   programs.thunar.plugins = with pkgs.xfce; [
      thunar-volman
   ];

   systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
         flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      '';
  };
}
