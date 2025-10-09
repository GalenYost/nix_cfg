{ config, lib, pkgs, ... }:

{
   fonts.packages = with pkgs; [
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
      nerd-fonts.dejavu-sans-mono
      nerd-fonts.meslo-lg

      (stdenvNoCC.mkDerivation {
         pname = "SF Pro";
         version = "1.0";
         src = ../fonts/SFPro;
         dontBuild = true;
         installPhase = ''
            mkdir -p $out/share/fonts/truetype
            cp -v *.ttf $out/share/fonts/truetype/
         '';
      })
   ];

   environment.variables = lib.mkForce {
      GTK_THEME = "Adwaita-dark";
      XDG_DATA_DIRS = "/run/current-system/sw/share";
   };

   environment.systemPackages = with pkgs; [
      # development
      git tmux tree-sitter lua-language-server
      neovim cargo vscode-langservers-extracted
      binaryninja-free postman vim asm-lsp nushell
      # tools
      wl-clipboard-rs ripgrep wget curl
      onefetch fastfetch home-manager
      unzip p7zip pwvucontrol htop nvtopPackages.nvidia
      mesa glib libGL meson ninja
      webrtc-audio-processing rnnoise
      desktop-file-utils obs-studio openssl
      # desktop
      kitty foot egl-wayland vulkan-tools libva libva-vdpau-driver
      grim slurp swappy xfce.thunar mesa-demos
      fuzzel mupdf mpv rnote
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gnome
      polkit_gnome hyprpicker
      hyprpaper hyprpanel
      # browser
      firefox chromium
      # cosmetics
      gtk3 gtk4 gnome-themes-extra 
      adwaita-icon-theme glib
      gsettings-desktop-schemas
      # socials
      telegram-desktop discord teams-for-linux
      gfn-electron youtube-music
      # drivers
      linuxKernel.packages.linux_zen.nvidia_x11
   ];
}
