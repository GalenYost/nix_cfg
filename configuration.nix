# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
   imports = [
      ./modules/default.nix
   ];

   nix.settings.experimental-features = [ "nix-command" "flakes" ];
   nix.settings.auto-optimise-store = true;

   nixpkgs.config.allowUnfree = true;
   nixpkgs.config.multiLib = true;

   i18n.defaultLocale = "en_US.UTF-8";
   console = lib.mkForce {
      font = "Lat2-Terminus16";
      keyMap = "us";
      useXkbConfig = true;
   };

   system.stateVersion = "25.05";
}
