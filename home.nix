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

      home.sessionVariables = {
         XCURSOR_THEME = "Adwaita-Dark";
         XCURSOR_SIZE = "24";
      };

      programs.neovim = {
         enable = true;
         viAlias = true;
         vimAlias = true;
      };

      home.pointerCursor = 
         let 
            getFrom = url: hash: name: {
               gtk.enable = true;
               x11.enable = true;
               name = name;
               size = 24;
               package = pkgs.runCommand "moveUp" {} ''
                  mkdir -p $out/share/icons
                  ln -s ${pkgs.fetchzip {
                     url = url;
                     sha256 = hash;
                  }} $out/share/icons/${name}
               '';
            };
         in
            getFrom 
               "https://github.com/manu-mannattil/adwaita-cursors/releases/download/v1.2/adwaita-cursors.tar.gz"
               "1i5y56b2qlcgb1qlxzmray63059b676i4xiw17ffyl7q77kvk9nc"
               "Adwaita-Dark";

      wayland.windowManager.hyprland.settings = {
         exec-once = [
            "gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita-Dark'"
            "gsettings set org.gnome.desktop.interface cursor-size 24"
         ];
      };
   };
}
