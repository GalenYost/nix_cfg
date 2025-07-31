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

   services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
   };

   # services.libinput.enable = true;
}
