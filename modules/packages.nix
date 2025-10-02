{ config, lib, pkgs, ... }:

{
   fonts.packages = with pkgs; [
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
      nerd-fonts.dejavu-sans-mono
   ];

   environment.variables = lib.mkForce {
      GTK_THEME = "Adwaita-dark";
      XDG_DATA_DIRS = "/run/current-system/sw/share";
   };

   environment.systemPackages = with pkgs; [
      # development
      git tmux tree-sitter lua-language-server
      neovim cargo vscode-langservers-extracted
      binaryninja-free postman vim asm-lsp
      # tools
      wl-clipboard-rs ripgrep wget curl
      onefetch fastfetch home-manager
      unzip p7zip pwvucontrol
      mesa glib libGL meson ninja htop
      webrtc-audio-processing rnnoise
      desktop-file-utils obs-studio openssl
      # desktop
      kitty egl-wayland vulkan-tools libva libva-vdpau-driver
      grim slurp swappy xfce.thunar mesa-demos
      fuzzel mupdf mpv rnote hyprpanel
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      polkit_gnome hyprpicker
      # browser
      firefox chromium
      # cosmetics
      gtk3 gtk4 gnome-themes-extra 
      adwaita-icon-theme glib
      gsettings-desktop-schemas
      hyprpaper
      # socials
      telegram-desktop discord teams-for-linux
      gfn-electron youtube-music
   ];
}
