{
    config,
    pkgs,
    lib,
    ...
}: {
    services.udiskie = {
        enable = true;
        notify = false;
        tray = "never";
        settings = {
            program_options = {
                automount = true;
                file_manager = "yazi";
            };
        };
    };
}
