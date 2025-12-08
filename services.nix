{
    config,
    pkgs,
    lib,
    ...
}: {
    services.udisks2.enable = true;
    services.devmon.enable = true;
    services.gvfs.enable = true;
    services.flatpak.enable = true;
    services.dbus = {
        enable = true;
        packages = [pkgs.xfce.thunar];
    };

    services.openssh = {
        enable = true;
        settings = {
            PermitRootLogin = "prohibit-password";
            PasswordAuthentication = false;
        };
    };

    services.libinput.enable = true;

    systemd.user.services.force-teleram-float = {
        description = "Force Telegram Media Viewer to float";
        wantedBy = ["graphical-session.target"];
        partOf = ["graphical-session.target"];
        serviceConfig = {
            ExecStart = "${pkgs.writeShellScript "niri-telegram-fix" ''
                PATH=${pkgs.niri}/bin:${pkgs.jq}/bin:$PATH

                niri msg -j event-stream | \
                jq --unbuffered -r '
                  select(.WindowOpenedOrChanged) |
                  .WindowOpenedOrChanged.window |
                  select(.app_id == "org.telegram.desktop" and .title == "Media viewer" and .is_floating == false) |
                  .id
                ' | \
                while read -r window_id; do
                  niri msg action toggle-window-floating --id "$window_id"
                done
            ''}";
            Restart = "always";
            RestartSec = 3;
        };
    };
}
