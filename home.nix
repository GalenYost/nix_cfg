{ config, pkgs, lib, ... }:

{
   home-manager.users.user = {
      home.pointerCursor = {
         name = "Adwaita";
         package = pkgs.adwaita-icon-theme;
         size = 22;
         x11 = {
           enable = true;
           defaultCursor = "Adwaita";
         };
      };

      home.stateVersion = "24.05";
      home.username = "user";
      home.homeDirectory = "/home/user";

      home.file.".inputrc".source = ./.inputrc;
      home.file.".bashrc".source = ./.bashrc;
      home.file.".bash_profile".source = ./.bash_profile;
      home.file.".tmux.conf".source = ./.tmux.conf;

      home.file.".config/nvim".source = ./nvim;
      home.file.".config/kitty".source = ./kitty;
      home.file.".config/gtk-3.0".source = ./gtk-3.0;
      home.file.".config/gtk-4.0".source = ./gtk-3.0;
      home.file.".config/git".source = ./git;
      home.file.".config/fuzzel".source = ./fuzzel;
      home.file.".config/hypr".source = ./hypr;
      home.file.".config/sway".source = ./sway;
   };
}
