
# update PATH to include personal bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

export PYTHONSTARTUP=~/.pythonrc

# This disables XON/XOFF so Ctrl-s and Ctrl-q mappings are free
stty -ixon

alias a="./a.out"
alias g++="g++ -std=c++11"
alias gadd="git add"
alias gstat="git status"
alias gcomm="git commit"
alias gdiff="git diff"
alias gpush="git push -u origin"
alias gpull="git pull origin"
