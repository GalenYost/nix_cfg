{
    config,
    pkgs,
    lib,
    ...
}: {
    programs.bash = {
        enable = true;
        completion.enable = true;
        enableLsColors = true;
        shellAliases = {
            ls = "ls -l";
            bat = "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -e percentage -e state";
        };
        promptInit = ''PS1='\[\033[38;2;24;185;2m\]\w\[\033[0m\]\[\033[38;2;14;186;186m\]> \[\033[0m\]' '';
        shellInit = ''
            download_songs() {
                local list_file="$1"

                if [[ ! -f "$list_file" ]]; then
                    echo "File not found: $list_file" >&2
                    return 1
                fi

                while IFS= read -r url; do
                    [[ -z "$url" || "$url" =~ ^# ]] && continue

                    yt-dlp \
                        -f bestaudio \
                        -o "%(title)s.%(ext)s" \
                        "$url"
                done < "$list_file"
            }
        '';
    };
}
