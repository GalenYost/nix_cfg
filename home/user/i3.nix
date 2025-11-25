{
  config,
  pkgs,
  lib,
  ...
}:

{
    xsession = {
        enable = true;
        windowManager.i3 = {
            enable = true;
            config = {
                modifier = "Mod4";
                terminal = "ghostty";
                workspaceLayout = "tabbed";
                fonts = {
                    names = [ "Iosevka Nerd Font" ];
                    style = "Regular";
                    size = 10.0;
                };
            };
        };
    };

    xsession.windowManager.i3.config.startup = [
        { command = "picom --backend glx -D 0"; always = true; notification = false; }
        { command = "xrandr --output HDMI-0 --mode 1920x1080 --rate 144"; always = true; notification = false; }
        { command = "nvidia-settings --load-config-only"; always = true; notification = false; }
        { command = "dex --autostart --environment i3"; always = true; notification = false; }
        { command = "xset s off"; always = true; notification = false; }
        { command = "xset s noblank"; always = true; notification = false; }
        { command = "xset -dpms"; always = true; notification = false; }
        { command = "nm-applet"; always = true; notification = false; }
    ];

    xsession.windowManager.i3.config.bars = [
        {
            statusCommand = "i3status";
            fonts = {
                names = [ "JetBrainsMono Nerd Font" ];
                style = "Regular";
                size = 10.0;
            };
            trayOutput = null;
        }
    ];

    xsession.windowManager.i3.config.modes = let
        modifier = config.xsession.windowManager.i3.config.modifier;
    in {
        resize = {
            j = "resize grow height 10 px or 10 ppt";
            h = "resize shrink width 10 px or 10 ppt";
            l = "resize grow width 10 px or 10 ppt";
            k = "resize shrink height 10 px or 10 ppt";
            Escape = "mode default";
            Return = "mode default";
            "${modifier}+r" = "mode default";
        };
    };

    xsession.windowManager.i3.config.window.commands = [
        {
            criteria = {
                class = "flameshot";
            };
            command = "border none, floating enable, fullscreen disable, move absolute position 0 0";
        }
        {
            criteria = {
                class = "Telegram";
                title = "Media viewer";
            };
            command = "border none, floating enable, fullscreen disable, move absolute position 0 0";
        }
    ];

    xsession.windowManager.i3.config.keybindings = let
        modifier = config.xsession.windowManager.i3.config.modifier;
        refresh_i3status = "killall -SIGUSR1 i3status";
        term = "ghostty";
        menu = "rofi -show drun";
        files = "ghostty -e yazi ~";
        music = "ghostty -e termusic";
        screenshot = "flameshot gui";
    in lib.mkOptionDefault {
        "${modifier}+r" = "mode resize";

        "${modifier}+Return" = "exec ${term}";
        "${modifier}+c" = "kill";
        "${modifier}+d" = "exec ${menu}";
        "${modifier}+z" = "exec ${screenshot}";

        "${modifier}+Shift+e" = "exec systemctl suspend";
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+r" = "restart";
        "${modifier}+Shift+q" = ''exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"'';

        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";

        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";

        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        "f11" = "fullscreen toggle global";
        "${modifier}+Shift+f" = "floating toggle";

        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";

        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";

        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && ${refresh_i3status}";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && ${refresh_i3status}";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && ${refresh_i3status}";
        "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && ${refresh_i3status}";
    };

    xsession.windowManager.i3.extraConfig = let
        modifier = config.xsession.windowManager.i3.config.modifier;
    in ''
        floating_modifier ${modifier}
        focus_on_window_activation smart
        tiling_drag modifier titlebar
    '';
}
