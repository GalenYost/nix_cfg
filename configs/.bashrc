[[ $- != *i* ]] && return
PS1='\u@\h \W \$ '

# options
set -o vi
bind -f ~/.inputrc

# bash completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# aliases
alias ls='ls --color=auto'
alias l='ls -l -a --color=auto'
alias grep='grep --color=auto'

alias ff='fastfetch'
alias of='onefetch'

alias gs='git status --short'
alias gd='git diff'

alias ga='git add'
alias gc='git commit'

alias gp='git push'
alias gu='git pull'

alias gl='git log'
alias gb='git branch'

alias gi='git init'
alias gcl='git clone'

alias gm='git merge'
alias gms='git merge --no-commit --no-ff'

# aliases (functions)
nixos-switch() {
   local host="${1:-nix}"
   sudo nixos-rebuild switch --flake ".#$host"
}
home-switch() {
   local user="${1:-user}"
   home-manager switch --flake ".#$user"
}

git_apply() {
    local branch1="${1:-master}"
    local branch2="${2:-main}"
    local file="$3"

    if [ -n "$file" ]; then
        gd "$branch1..$branch2" -- "$file" | git apply -3
    else
        gd "$branch1..$branch2" | git apply -3
    fi
}
