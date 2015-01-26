export HISTCONTROL=erasedups
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTIGNORE="$(cat ~/.histignore|sed -e ':a;N;$!ba;s/\n/:/g')"
shopt -s histappend
