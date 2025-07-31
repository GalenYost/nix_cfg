{ config, pkgs, lib, ... }:

{
   home-manager.users.user = {
      home.stateVersion = "24.05";
      home.username = "user";
      home.homeDirectory = "/home/user";

      home.file.".inputrc".source = ./.inputrc;
      home.file.".bashrc".source = ./.bashrc;
      home.file.".bash_profile".source = ./.bash_profile;
      home.file.".tmux.conf".source = ./.tmux.conf;

      home.file.".config/nvim".source = ./nvim;
      home.file.".config/foot".source = ./foot;
      home.file.".config/gtk-3.0".source = ./gtk-3.0;
      home.file.".config/gtk-4.0".source = ./gtk-3.0;
      home.file.".config/git".source = ./git;
      home.file.".config/fuzzel".source = ./fuzzel;
      home.file.".config/hypr".source = ./hypr;

      programs.neovim = {
         enable = true;
         viAlias = true;
         vimAlias = true;
      };

      home.pointerCursor = {
         name = "Adwaita-dark";
         size = 24;
         gtk.enable = true;
         x11.enable = true;
         package = pkgs.adwaita-icon-theme;
      };

      wayland.windowManager.hyprland.settings = {
         exec-once = [
            "gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita-dark'"
            "gsettings set org.gnome.desktop.interface cursor-size 24"
         ];
      };
   };
}
