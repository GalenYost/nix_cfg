{
    config,
    pkgs,
    lib,
    ...
}: {
    programs.tmux = {
        enable = true;
        keyMode = "vi";
        clock24 = true;
        shell = "${pkgs.bash}/bin/bash";
        mouse = true;
        shortcut = "b";
        baseIndex = 1;
        disableConfirmationPrompt = true;
    };
}
