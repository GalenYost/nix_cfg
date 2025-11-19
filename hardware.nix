{ config, lib, pkgs, modulesPath, ... }:

{
   imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

   boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
   boot.initrd.kernelModules = [ "dm-snapshot" "dm-mod" ];
   boot.kernelParams = [ "nvidia_drm.modeset=1" ];
   boot.kernelModules = [ "kvm-amd" ];
   boot.extraModulePackages = [ ];

   boot.initrd.systemd.enable = true;
   boot.initrd.services.lvm.enable = true;

   boot.loader.systemd-boot.enable = true;
   boot.loader.systemd-boot.configurationLimit = 3;
   boot.loader = {
      efi = {
         canTouchEfiVariables = true;
      };
   };

   services.xserver.videoDrivers = [ "nvidia" ];

   hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      gsp.enable = true;
      videoAcceleration = true;
      open = true;
      package = config.boot.kernelPackages.nvidia_x11;
   };
   hardware.graphics.enable = true;
   hardware.display.outputs."HDMI-A-1".mode = "1920x1080@144";

   system.autoUpgrade.enable = true;
   system.autoUpgrade.allowReboot = false;

   fileSystems."/" = {
      device = "/dev/vg0/root";
      fsType = "ext4";
   };
   fileSystems."/boot" = {
      device = "/dev/nvme0n1p1";
      fsType = "vfat";
      options = [ "noatime" ];
   };
   fileSystems."/mnt/USB_FLASH" = {
      device = "/dev/disk/by-uuid/4E21-0000";
      fsType = "exfat";
      options = [ "users" "nofail" ];
   };

   swapDevices = [ ];

   nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

   networking.useDHCP = lib.mkDefault true;
   # networking.interfaces.enp8s0.useDHCP = lib.mkDefault true;

   hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
