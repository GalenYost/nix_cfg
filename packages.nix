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
    cargo
    binaryninja-free
    ghostty
    gcc libcxx
    clang clang-tools libclang
    gnumake stdenv.cc
    zvm
    # tools
    xwayland-satellite
    home-manager
    wl-clipboard-rs
    ripgrep
    wget
    curl
    onefetch
    fastfetch
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
    protonvpn-gui
    rofi
    mupdf
    mpv
    rnote
    polkit_gnome
    swww
    ungoogled-chromium
    aria2
    yt-dlp
    yazi
    termusic
    onlyoffice-desktopeditors
    # cosmetics
    gnome-themes-extra
    adwaita-icon-theme
    gsettings-desktop-schemas
    picom xorg.xrandr xclip xsel
    # socials
    telegram-desktop
    discord
    teams-for-linux
  ];
}
