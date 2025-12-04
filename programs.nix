{
    config,
    pkgs,
    lib,
    ...
}: {
    programs.steam.enable = true;
    programs.xfconf.enable = true;
    programs.dconf.enable = true;

    programs.firefox.enable = true;
    programs.thunar.enable = true;

    programs.obs-studio = {
        enable = true;
        package = pkgs.obs-studio;
        plugins = with pkgs.obs-studio-plugins; [
            wlrobs
            input-overlay
            obs-pipewire-audio-capture
            obs-vkcapture
        ];
    };
}
