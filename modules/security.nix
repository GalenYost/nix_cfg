{ config, lib, pkgs, ... }: 

{
  security.polkit.enable = true;
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;
}
