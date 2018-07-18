if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# added by Miniconda3 installer
export PATH="/usr/local/bin/miniconda3/bin:$PATH"
export CLICOLOR=1

# update PATH to include personal bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
