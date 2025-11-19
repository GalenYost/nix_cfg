{
  config,
  pkgs,
  lib,
  ...
}:

{
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.meslo-lg

    (stdenvNoCC.mkDerivation {
      pname = "SF Pro";
      version = "1.0";
      src = ./fonts/SFPro;
      dontBuild = true;
      installPhase = ''
        mkdir -p $out/share/fonts/truetype
        cp -v *.ttf $out/share/fonts/truetype/
      '';
    })
  ];

  environment.systemPackages = with pkgs; [
    # development
    tree-sitter
    cargo
    binaryninja-free
    postman
    ghostty
    gcc libcxx
    clang clang-tools libclang
    gnumake stdenv.cc
    # lsp servers
    nixd
    nixfmt-rfc-style
    vscode-langservers-extracted
    lua-language-server
    # tools
    xwayland-satellite
    wl-clipboard-rs
    ripgrep
    wget
    curl
    onefetch
    fastfetch
    home-manager
    unzip
    p7zip
    pwvucontrol
    htop
    nvtopPackages.nvidia
    mesa
    glib
    libGL
    webrtc-audio-processing
    rnnoise
    desktop-file-utils
    openssl
    libva
    libva-vdpau-driver
    vulkan-tools
    mesa-demos
    fzf
    imagemagick
    # desktop
    egl-wayland
    rofi
    flameshot
    mupdf
    mpv
    rnote
    polkit_gnome
    swww
    grim
    slurp
    swappy
    ungoogled-chromium
    aria2
    yt-dlp
    yazi
    termusic
    onlyoffice-desktopeditors
    # cosmetics
    gtk3
    gtk4
    gnome-themes-extra
    adwaita-icon-theme
    gsettings-desktop-schemas
    # socials
    telegram-desktop
    discord
    teams-for-linux
  ];
}
