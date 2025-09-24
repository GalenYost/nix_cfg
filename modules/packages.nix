{ config, lib, pkgs, ... }:

{
   fonts.packages = with pkgs; [
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
      nerd-fonts.dejavu-sans-mono
      inter roboto
      (stdenvNoCC.mkDerivation {
         pname = "sf-pro";
         version = "1.0";
         src = ../fonts/SFPro;
         dontUnpack = true;
         installPhase = ''
            mkdir -p $out/share/fonts/opentype
            cp -v $src/*.otf $out/share/fonts/opentype/ || true
            cp -v $src/*.ttf $out/share/fonts/opentype/ || true
         '';
      })
   ];

   fonts.fontconfig.defaultFonts = {
      sansSerif = [ "SF Pro Display" ];
      serif     = [ "SF Pro Text" ];
      monospace = [ "DejaVuSansM Nerd Font Mono" ];
   };

   environment.variables = lib.mkForce {
      GTK_THEME = "Adwaita-dark";
   };

   environment.systemPackages = with pkgs; [
      # development
      git tmux tree-sitter lua-language-server
      neovim cargo
      # tools
      wl-clipboard-rs ripgrep wget curl
      onefetch fastfetch home-manager
      unzip p7zip nwg-look pwvucontrol
      mesa glib libGL meson ninja htop
      webrtc-audio-processing rnnoise
      desktop-file-utils obs-studio xclip
      xorg.xinit
      # wl-clipboard-x11 
      # desktop
      kitty egl-wayland vulkan-tools libva libva-vdpau-driver
      grim slurp swappy xfce.thunar mesa-demos
      fuzzel mupdf mpv rnote picom feh
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      polkit_gnome hyprpaper flameshot
      i3 i3blocks i3status rofi i3lock scrot
      # browser
      firefox chromium
      # cosmetics
      gtk3 gtk4 gnome-themes-extra 
      adwaita-icon-theme nordic
      # socials
      telegram-desktop discord teams-for-linux
      gfn-electron youtube-music
   ];
}
