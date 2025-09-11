# [[ -z $WAYLAND_DISPLAY && $XDG_VTNR -eq 1 ]] && exec Hyprland
[ "$(tty)" = "/dev/tty1" ] && exec sway
