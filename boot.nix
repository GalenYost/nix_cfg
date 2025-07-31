{ config, lib, pkgs, ... }:

{
  boot.initrd.systemd.enable = true;
  boot.initrd.services.lvm.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
}
