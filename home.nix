{ config, pkgs, lib, ... }:

{
   home.pointerCursor = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 16;
      x11 = {
        enable = true;
        defaultCursor = "Adwaita";
      };
   };

   home.stateVersion = "25.05";
   home.username = "user";
   home.homeDirectory = "/home/user";

   home.file.".inputrc".source = ./configs/.inputrc;
   home.file.".bashrc".source = ./configs/.bashrc;
   home.file.".bash_profile".source = ./configs/.bash_profile;
   home.file.".tmux.conf".source = ./configs/.tmux.conf;

   home.file.".config/nvim" = {
      source = ./configs/nvim;
      recursive = true;
   };
   home.file.".config/kitty".source = ./configs/kitty;
   home.file.".config/gtk-3.0".source = ./configs/gtk-3.0;
   home.file.".config/gtk-4.0".source = ./configs/gtk-3.0;
   home.file.".config/git".source = ./configs/git;
   home.file.".config/fuzzel".source = ./configs/fuzzel;
   home.file.".config/hypr".source = ./configs/hypr;
   home.file.".config/sway".source = ./configs/sway;
}
