{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./network.nix
    ./packages.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./users.nix
  ];
}
