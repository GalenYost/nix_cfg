{ config, pkgs, lib, ... }:

{
   home.pointerCursor = {
      name = "Adwaita";
      gtk.enable = true;
      x11.enable = true;
      size = 16;
      package = pkgs.adwaita-icon-theme;
   };

   home.stateVersion = "25.05";
   home.username = "user";
   home.homeDirectory = "/home/user";

   home.file = {
      ".config/nushell" = {
         source = ./configs/nushell;
         recursive = true;
      };
      ".config/hyprpanel" = {
         source = ./configs/hyprpanel;
         recursive = true;
      };

      ".tmux.conf".source = ./configs/.tmux.conf;

      ".config/xdg-desktop-portal".source = ./configs/xdg-desktop-portal;
      ".config/nvim".source = ./configs/nvim;
      ".config/foot".source = ./configs/foot;
      ".config/gtk-3.0".source = ./configs/gtk-3.0;
      ".config/gtk-4.0".source = ./configs/gtk-3.0;
      ".config/git".source = ./configs/git;
      ".config/hypr".source = ./configs/hypr;
      ".config/fuzzel".source = ./configs/fuzzel;

      ".local/share/applications".source = ./configs/applications;
      "wallpaper.jpg" = {
         target = ".local/share/backgrounds/wallpaper.jpg";
         source = ./configs/wallpaper.jpg;
      };
   };
}
