$env.config.buffer_editor = "nvim"
$env.config.show_banner = false
$env.PROMPT_COMMAND_RIGHT = {||}

alias vim = nvim

# functions
def nixos-switch [] {
   sudo nixos-rebuild switch --flake .#nix
}

def home-switch [] {
   home-manager switch --flake .#user
}

def bat [] {
   upower -i /org/freedesktop/UPower/devices/battery_BAT0 | find -n percentage state | print --raw
}
