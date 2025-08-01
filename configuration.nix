# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
   imports = [
      ./hardware-configuration.nix
      ./security.nix
      ./services.nix
      ./programs.nix
      ./users.nix
      ./packages.nix
      ./network.nix
      ./home.nix
      (import "${home-manager}/nixos")
   ];

   nixpkgs.config.allowUnfree = true;
   nixpkgs.config.multiLib = true;

   i18n.defaultLocale = "en_US.UTF-8";
   console = lib.mkForce {
      font = "Lat2-Terminus16";
      keyMap = "us";
      useXkbConfig = true;
   };

   nixpkgs.overlays = [
      (self: super: {
         flameshot = super.flameshot.overrideAttrs (old: {
            nativeBuildInputs = old.nativeBuildInputs or old.buildInputs ++ [ self.grim ];
            cmakeFlags = (old.cmakeFlags or []) ++ [ "-DUSE_WAYLAND_GRIM=ON" ];
         });
      })
   ];

   system.stateVersion = "25.05";
}
