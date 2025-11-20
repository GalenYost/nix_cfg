[[ $- != *i* ]] && return
PS1='\[\033[38;2;24;185;2m\]\w\[\033[0m\]\[\033[38;2;14;186;186m\]> \[\033[0m\]'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -e percentage -e state'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"

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
