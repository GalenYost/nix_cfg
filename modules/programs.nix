{ config, lib, pkgs, ... }:

{
   programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
   };

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

   # systemd.user.services.hyprland = {
   #    description = "Hyprland Wayland Compositor";
   #    after = [ "graphical.target" ];
   #    wantedBy = [ "default.target" ];
   #    environment = {
   #       XDG_SESSION_TYPE = "wayland";
   #       XDG_CURRENT_DESKTOP = "Hyprland";
   #       XDG_RUNTIME_DIR = "%t";
   #       WAYLAND_DISPLAY = "wayland-1";
   #    };
   #    serviceConfig = {
   #       ExecStart = "${pkgs.hyprland}/bin/Hyprland";
   #    };
   # };
}
