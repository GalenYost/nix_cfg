{ config, lib, pkgs, ... }:

{
   programs.hyprland = {
      enable = true;
      xwayland.enable = true;
   };

   programs.steam.enable = true;

   programs.xfconf.enable = true;
   programs.dconf = {
      enable = true;
      profiles.user = {
         databases = [{
            settings = {
               "org/gnome/desktop/interface" = {
                  color-scheme = "prefer-dark";
               };
            };
         }];
      };
   };

   systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
         flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      '';
   };
}
