# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
# Mine
export PATH="$PATH:$HOME/Mine/My_bin"
export BASHRC="$HOME/.bashrc"

alias files='nautilus . &'
alias temp='cd ~/Mine/Temp'
alias mine='cd ~/Mine'
alias solverfetch='fastfetch --file ~/.solver.txt'
alias open='xdg-open'
callback() {
    # Runs your specific venv python, then the script, then passes all arguments
    /home/ziadz3tar/Mine/Pro_PY/CALLBACKPING/.venv/bin/python /home/ziadz3tar/Mine/Pro_PY/CALLBACKPING/callback2 "$@"
}
#. "$HOME/.cargo/env"
#export PATH="$HOME/.cargo/bin:$PATH"
