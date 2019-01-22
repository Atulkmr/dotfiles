
# update PATH to include personal bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

export PYTHONSTARTUP=~/.pythonrc

# This disables XON/XOFF so Ctrl-s and Ctrl-q mappings are free
stty -ixon
