{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware.nix
    ./programs.nix
    ./network.nix
    ./users.nix
    ./services.nix
    ./packages.nix
    ./security.nix

    ./flatpak.nix
    ./niri.nix
    ./pipewire.nix

    ./foot.nix
    ./git.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.auto-optimise-store = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.multiLib = true;

  system.stateVersion = "25.05";
}
