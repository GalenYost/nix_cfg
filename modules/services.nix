{ config, lib, pkgs, ... }:

{
   services.udisks2.enable = true;
   services.devmon.enable = true;
   services.gvfs.enable = true;
   services.flatpak.enable = true;
   services.dbus.enable = true;

   services.greetd = {
      enable = true;
      settings.default_session = {
         command = "Hyprland";
         user = "user";
      };
   };

   services.openssh = {
      enable = true;
      settings = {
         PermitRootLogin = "prohibit-password";
         PasswordAuthentication = false;
      };
   };

   services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      wireplumber = {
         enable = true;
         extraConfig = {
            "noise-suppressed-mic" = {
               "monitor.rules" = [
                  {
                     matches = [
                        {
                           "node.name" = "~alsa_input.*";
                        }
                     ];
                     actions = {
                        update_props = {
                           "node.nick" = "Mic (Noise Suppressed)";
                           "filter.graph-name" = "rnnoise";
                           "filter.media-role" = "Communication";
                        };
                     };
                  }
               ];
            };
         };
      };
   };

   systemd.user.services.hyprland_resume = {
      enable = true;
      description = "hyprland reset display";
      after = [ "suspend.target" ];
      serviceConfig = {
         Type = "oneshot";
         ExecStart = "/run/current-system/sw/bin/hyprctl dispatch dpms off";
         ExecStartPost = "/run/current-system/sw/bin/sh -c '/run/current-system/sw/bin/sleep 1; /run/current-system/sw/bin/hyprctl dispatch dpms on'";
      };
      wantedBy = [ "suspend.target" ];
   };

   xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [
         pkgs.xdg-desktop-portal-gtk
         pkgs.xdg-desktop-portal-hyprland
      ];
   };

   # services.libinput.enable = true;
}
