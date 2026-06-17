
# =============================================================================
# PATH — set before Oh My Zsh loads
# Deduplication prevents repeated entries on `source ~/.zshrc`
# =============================================================================
export BUN_INSTALL="$HOME/.bun"
export RC="$HOME/.zshrc"
# Prepend only if not already present
_prepend_path() {
    [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
}

_prepend_path "$HOME/.local/bin"
_prepend_path "$HOME/Mine/My_bin"
_prepend_path "$BUN_INSTALL/bin"

unfunction _prepend_path
# =============================================================================
# Oh My Zsh
# =============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""           # using Starship instead

setopt NO_BANG_HIST    # disable ! history expansion

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# =============================================================================
# Prompt
# =============================================================================
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
# =============================================================================
# Environment
# =============================================================================
export EDITOR=/usr/bin/nvim
export PATH_TO_FX=/opt/javafx/javafx-sdk-25.0.2/lib
export EZA_CONFIG_DIR="$HOME/.config/eza"

# =============================================================================
# Bun completions
# =============================================================================
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# =============================================================================
# Navigation
# =============================================================================
alias temp='cd ~/Mine/Temp'
alias mine='cd ~/Mine'


# =============================================================================
# nvim profiles
# =============================================================================

alias vz='NVIM_APPNAME=nvim-ziadz3tar nvim'
alias vchad='NVIM_APPNAME=nvchad nvim'


# =============================================================================
# Core utilities
# =============================================================================
alias ls='eza --icons'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -lAh'
alias llla='ls -lA --blocks permission,size,date,name --date "+%d/%m"'
alias lt='ls -ltrh'
alias lsize='ls -lhS'

alias open='xdg-open'
alias md='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

alias df='df -h'
alias du='du -h -d 1'

# =============================================================================
# Search & text
# =============================================================================
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias findd='find . -type d -name'
alias findf='find . -type f -name'
alias cleanup='find . -type f -name "*~" -delete'
alias batman='f(){ man "$@" | bat -l man -p; }; f'

# =============================================================================
# System info & monitoring
# =============================================================================
alias solverfetch='fastfetch --file ~/.solver.txt'
alias path='echo $PATH | tr ":" "\n" | bat'
alias ports='netstat -tulanp'
alias topmem='ps aux --sort=-%mem | head'
alias topcpu='ps aux --sort=-%cpu | head'

# =============================================================================
# Shell management
# =============================================================================
alias src='clear && source ~/.zshrc'
alias reload='exec zsh'
alias hist='history'
alias histg='history | grep'
alias theme='() { sed -i "s/^ZSH_THEME=.*/ZSH_THEME=\"$1\"/" ~/.zshrc && source ~/.zshrc }'
alias cx='chmod +x'

# =============================================================================
# Network & servers
# =============================================================================
alias serve='python3 -m http.server'

# =============================================================================
# Archives
# =============================================================================
alias untar='tar -xvf'
alias targz='tar -czvf'

# =============================================================================
# Cargo 
# =============================================================================
alias cr='cargo run'

# =============================================================================
# Git
# =============================================================================
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -v --amend'
alias gco='git checkout'
alias gcm='git checkout main'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gds='git diff --staged'
alias gundo='git reset --soft HEAD~1'

# =============================================================================
# VMs (quickemu)
# =============================================================================
alias win10='quickemu --vm $HOME/quickemu/windows10.conf'
alias archlinux='quickemu --vm $HOME/quickemu/archlinux.conf'
alias ubuntuserver='quickemu --vm $HOME/quickemu/ubuntuserver.conf'

# =============================================================================
# Fun / misc
# =============================================================================
alias lake='asciiquarium'
alias cttlinutil='cargo run --manifest-path ~/Mine/REPOs/linutil/Cargo.toml --release'

alias Xreboot="mpv --fs --no-input-default-bindings --input-conf=/dev/null --no-osc --no-osd-bar \
    '$HOME/Videos/Downloaded/Element Of Surprise Green Screen [1280p][mp4].mp4' && reboot"
alias Xpoweroff="mpv --fs --no-input-default-bindings --input-conf=/dev/null --no-osc --no-osd-bar \
    '$HOME/Videos/Downloaded/Element Of Surprise Green Screen [1280p][mp4].mp4' && poweroff"

# =============================================================================
# Functions
# =============================================================================

# Extract URL from a .desktop file
ds() {
    if [ -z "$1" ]; then
        echo "Usage: ds <desktop-file>"
        return 1
    fi
    grep '^URL' "$1" | cut -d= -f2- | sed 's|^file:||' | envsubst
}

ZSH_HIGHLIGHT_STYLES[comment]='fg=8,bold'
