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

   # home.file.".bash_profile".source = ./configs/.bash_profile;
   home.file.".inputrc".source = ./configs/.inputrc;
   home.file.".bashrc".source = ./configs/.bashrc;
   home.file.".tmux.conf".source = ./configs/.tmux.conf;

   home.file.".local/share/applications".source = ./configs/applications;
   home.file."wallpaper.jpg" = {
      target = ".local/share/backgrounds/wallpaper.jpg";
      source = ./configs/wallpaper.jpg;
   };

   home.file.".config/fontconfig".source = ./configs/fontconfig;
   home.file.".config/xdg-desktop-portal".source = ./configs/xdg-desktop-portal;
   home.file.".config/nvim".source = ./configs/nvim;
   home.file.".config/kitty".source = ./configs/kitty;
   home.file.".config/gtk-3.0".source = ./configs/gtk-3.0;
   home.file.".config/gtk-4.0".source = ./configs/gtk-3.0;
   home.file.".config/git".source = ./configs/git;
   home.file.".config/i3".source = ./configs/i3;
   home.file.".config/rofi".source = ./configs/rofi;

   # HYPRLAND #
   # home.file.".config/hypr".source = ./configs/hypr;
   # home.file.".config/fuzzel".source = ./configs/fuzzel;
   # home.file.".config/hyprpanel" = {
   #    source = ./configs/hyprpanel;
   #    recursive = true;
   # };
}
