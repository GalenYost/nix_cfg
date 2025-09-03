{ config, lib, pkgs, ... }:

{
   fonts.packages = with pkgs; [
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
      inter roboto
   ];

   environment.variables = lib.mkForce {
      GTK_THEME = "Adwaita-dark";
      XCURSOR_THEME = "Adwaita";
      XCURSOR_SIZE = "22";
      QT_QPA_PLATFORM = "wayland";
   };

   environment.systemPackages = with pkgs; [
      # development
      neovim git tmux tree-sitter lua-language-server
      # tools
      wl-clipboard ripgrep wget curl rnote
      onefetch fastfetch home-manager
      unzip p7zip nwg-look pwvucontrol
      mesa glib libGL
      # desktop
      kitty egl-wayland vulkan-tools libva libva-vdpau-driver
      grim slurp swappy xfce.thunar mesa-demos
      rnote fuzzel hyprpaper mupdf mpv
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland polkit_gnome
      # browser
      firefox chromium
      # cosmetics
      gtk3 gtk4 gnome-themes-extra 
      adwaita-icon-theme
      # socials
      telegram-desktop discord teams-for-linux
      gfn-electron webcord
   ];
}
