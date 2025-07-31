{ config, lib, pkgs, ... }:

{
  networking.hostName = "nixos";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Kyiv";

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
