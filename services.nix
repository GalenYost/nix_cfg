{ config, lib, pkgs, ... }:

{
   services.udisks2.enable = true;
   services.devmon.enable = true;
   services.gvfs.enable = true;
   services.flatpak.enable = true;

   services.getty = {
      autologinUser = "user";
      autologinOnce = true;
   };

   services.openssh = {
      enable = true;
      settings = {
         PermitRootLogin = "prohibit-password";
         PasswordAuthentication = false;
      };
   };

   services.xserver.displayManager.lightdm.enable = false;

   services.xserver.enable = true;

   services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;

      extraConfig.pipewire."10-echo-cancel" = {
      "context.modules" = [
        {
          name = "libpipewire-module-echo-cancel";
          args = {
            "aec.method" = "webrtc";
            "aec.args" = { "noise_suppression" = true; };
            "source.props" = {
              "node.name" = "EchoCancelSource";
              "node.description" = "Microphone (Echo Cancelled)";
            };
          };
        }
      ];
    };
   };

   # services.libinput.enable = true;
}
