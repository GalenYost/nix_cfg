{
    config,
    pkgs,
    lib,
    ...
}: {
    services.flameshot = {
        enable = true;
        settings = {
            General = {
                startupLaunch = true;
                showStartupLaunchMessage = false;
                disabledTrayIcon = true;
                useGrimAdapter = true;
            };
        };
    };
}
