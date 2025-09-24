{ config, lib, pkgs, ... }:

{
   services.udisks2.enable = true;
   services.devmon.enable = true;
   services.gvfs.enable = true;
   services.flatpak.enable = true;

   # services.getty = {
   #    autologinUser = "user";
   #    autologinOnce = true;
   # };

   services.openssh = {
      enable = true;
      settings = {
         PermitRootLogin = "prohibit-password";
         PasswordAuthentication = false;
      };
   };

   services.xserver.enable = true;
   services.xserver.xkb = {
      layout = "us,ua,ru";
      options = "grp:alt_shift_toggle";
   };

   services.xserver.displayManager.lightdm = {
      enable = true;
      background = "/home/user/.local/share/backgrounds/wallpaper.jpg";
      greeters.slick = {
         enable = true;
         extraConfig = ''
            [Greeter]
            background-blur=10
         '';
      };
   };
   services.xserver.windowManager.i3.enable = true;

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
