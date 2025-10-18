{ pkgs }:

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

   environment.systemPackages = with pkgs; [
      # development
      git tmux tree-sitter lua-language-server
      neovim cargo vscode-langservers-extracted
      binaryninja-free postman vim asm-lsp nushell
      nixd
      # tools
      wl-clipboard-rs ripgrep wget curl
      onefetch fastfetch home-manager
      unzip p7zip pwvucontrol htop nvtopPackages.nvidia
      mesa glib libGL meson ninja
      webrtc-audio-processing rnnoise
      desktop-file-utils openssl
      # desktop
      foot egl-wayland vulkan-tools libva libva-vdpau-driver
      xfce.thunar mesa-demos
      fuzzel mupdf mpv rnote
      polkit_gnome hyprpicker
      grim slurp swappy
      # browser
      firefox chromium
      # cosmetics
      gtk3 gtk4 gnome-themes-extra 
      adwaita-icon-theme glib
      gsettings-desktop-schemas
      # socials
      telegram-desktop discord
      teams-for-linux
      youtube-music
   ];
}
