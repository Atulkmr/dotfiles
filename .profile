# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PYTHONSTARTUP=~/.pythonrc
export PATH=$PATH:~/bin
