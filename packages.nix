{ config, lib, pkgs, ... }:

{
   fonts.packages = with pkgs; [
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term
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
      foot wl-clipboard flameshot mesa-demos
      git fuzzel libva-vdpau-driver libva
      vulkan-tools flatpak udisks2 gvfs usbutils
      wget curl udiskie rnote easyeffects
      onefetch fastfetch grim slurp
      telegram-desktop discord tmux
      jsonfmt gtk3 gtk4 xfce.thunar
      gnome-themes-extra xfce.thunar-volman
      libgcc rocmPackages.clang
      lua-language-server rust-analyzer
      prisma tree-sitter svelte-language-server
      vimPlugins.packer-nvim
      xdg-desktop-portal polkit_gnome
      xdg-desktop-portal-wlr
      pipewire wireplumber gfn-electron
      adwaita-icon-theme unzip p7zip
      mesa glib libGL libxkbcommon
      xorg.libX11 xorg.libXext xorg.libXrender
      xorg.libXtst pwvucontrol
   ];
}
