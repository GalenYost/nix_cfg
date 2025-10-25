$env.config.buffer_editor = "nvim"
$env.config.show_banner = false
$env.PROMPT_COMMAND_RIGHT = {||}

$env.PATH = ($env.PATH | prepend $"($env.HOME)/.nvm/versions/node/v25.0.0/bin")

# functions
def nixos-switch [] {
   sudo nixos-rebuild switch --flake .#nix
}

def home-switch [] {
   home-manager switch --flake .#user
}

def nvm [...args] {
    let joined = ($args | str join ' ')
    bash -c $"source ~/.nvm/nvm.sh; nvm ($joined)"
}

def download [urls: list<string>, path: string, format: string = "mp3"] {
   let path_str = ($path | into string)
   mkdir $path_str
   for url in $urls {
        yt-dlp -x --audio-format $format --output "$path_str/%(title)s.%(ext)s" --external-downloader aria2c $url
   }
}

def bat [] {
   upower -i /org/freedesktop/UPower/devices/battery_BAT0 | find -n percentage state | print --raw
}
