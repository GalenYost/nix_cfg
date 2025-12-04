{
    config,
    pkgs,
    lib,
    ...
}: {
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
        gcc
        libcxx
        clang
        clang-tools
        libclang
        gnumake
        stdenv.cc
        zvm
        # tools
        home-manager
        ripgrep
        wget
        curl
        onefetch
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
        jq
        imagemagick
        grim
        slurp
        # desktop
        protonvpn-gui
        mupdf
        mpv
        rnote
        polkit_gnome
        aria2
        yt-dlp
        termusic
        onlyoffice-desktopeditors
        librewolf
        # cosmetics
        gnome-themes-extra
        adwaita-icon-theme
        gsettings-desktop-schemas
        picom
        xorg.xrandr
        xclip
        xsel
    ];
}
