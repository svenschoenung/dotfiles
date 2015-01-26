if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b ~/.dircolors)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
