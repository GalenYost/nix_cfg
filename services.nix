{ config, pkgs, lib, ... }:

{
    services.udisks2.enable = true;
    services.devmon.enable = true;
    services.gvfs.enable = true;
    services.flatpak.enable = true;
    services.dbus = {
        enable = true;
        packages = [ pkgs.xfce.thunar ];
    };

    services.openssh = {
        enable = true;
        settings = {
            PermitRootLogin = "prohibit-password";
            PasswordAuthentication = false;
        };
    };

    services.libinput.enable = true;
}
