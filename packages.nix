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
      XCURSOR_SIZE = "24";
      QT_QPA_PLATFORM = "wayland";
   };

   environment.systemPackages = with pkgs; [
      neovim firefox nodejs_24 cargo rustup
      kitty wl-clipboard mesa-demos egl-wayland
      git fuzzel libva-vdpau-driver libva
      vulkan-tools usbutils chromium
      wget curl rnote refind
      onefetch fastfetch grim slurp swappy
      telegram-desktop vesktop tmux malcontent
      jsonfmt gtk3 gtk4 xfce.thunar ripgrep
      gnome-themes-extra xfce.thunar-volman
      libgcc rocmPackages.clang
      lua-language-server rust-analyzer
      prisma tree-sitter svelte-language-server
      xdg-desktop-portal polkit_gnome
      xdg-desktop-portal-wlr hyprpaper
      pipewire wireplumber gfn-electron
      adwaita-icon-theme unzip p7zip
      mesa glib libGL libxkbcommon
      xorg.libX11 xorg.libXext xorg.libXrender
      xorg.libXtst pwvucontrol nwg-look
   ];
}
