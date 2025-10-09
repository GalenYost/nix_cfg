$env.config.buffer_editor = "nvim"
$env.config.show_banner = false
$env.PROMPT_COMMAND_RIGHT = {||}

alias l = ls -l -a

# functions
def nixos-switch [] {
   sudo nixos-rebuild switch --flake .#nix
}

def home-switch [] {
   home-manager switch --flake .#user
}
