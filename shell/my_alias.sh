# Enable flow controll
stty -ixon
#
# Activate syntax color for ls
export CLICOLOR=1
#
# Personal alias
alias cp="cp -iRv"
alias mv="mv -iv"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -lhF"
alias rm="rm -rfv"
alias vi="nvim"
alias vim="nvim"
alias grep="grep --color=auto"
alias k="kubectl"
#
# Load RVM
alias load-rvm="source /etc/profile.d/rvm.sh"
#
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
#
# Gcc
alias gmcc="gcc -Wall -Wextra -Werror"
#
# Reload
alias reload="source ~/.zshrc"
#
# Meteo
alias weather="curl -4 wttr.in/toulouse"
alias weather-paris="curl -4 wttr.in/paris"
#
# Docker
alias docker-clean-unused="docker system prune --volumes --all --force"
#
# Git
alias gs="git status"
alias gc="git clone"
alias gp="git push"
alias gm="git commit -m"
alias gma="git commit -am"
alias ga="git add"
alias gaa="git add --all"
#
# Curl JSON
alias json="json_pp | $HOME/env/bin/pygmentize -l json"
#
# Python env
alias dev-env=". env/bin/activate"
alias test-env=". envtest/bin/activate"
#
# tmux
alias tmux="tmux -u"
#
# pbcopy linux
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
