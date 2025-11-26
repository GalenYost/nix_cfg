{
    config,
    pkgs,
    lib,
    ...
}: {
    services.udiskie = {
        enable = true;
        notify = false;
        tray = "always";
        settings = {
            program_options = {
                automount = true;
                file_manager = "yazi";
            };
            device_config = [
                {
                    id_uuid = ["4E21-0000"];
                    automount = true;
                    ignore = false;
                    options = ["uid=1000" "gid=1000" "umask=022"];
                }
            ];
        };
    };
}
