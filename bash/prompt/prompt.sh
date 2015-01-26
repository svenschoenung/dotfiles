clr() {
	if [ -x "/usr/bin/tput" ]; then
		case $1 in
			bold) echo -n "\[$(tput bold)\]";;
			none) echo -n "\[$(tput sgr0)\]";;
			*) echo -n "\[$(tput setaf $1)\]";;
		esac
	fi
}

prompt_exit_code() {
	local exit_code="$?"
	if [ "$exit_code" == "0" ]; then
		echo -n "$(clr 2)✔$(clr none)"
	else
		echo -n "$(clr 1)✖$exit_code$(clr none) "
	fi
}

prompt_user() {
	echo -n "$(clr 5)\u@\h$(clr none)"
}

prompt_dir() {
	echo -n "$(clr bold)$(clr 4)\w$(clr none)"
}

prompt_colon() {
	if [ -n "$(ls -A 2> /dev/null | grep "^\." | head -n 1)" ]; then
		local colon="∷"
	else 
		local colon=":"
	fi

	if [ -w "$PWD" ]; then
		echo -n "$colon"
	else
		echo -n "$(clr bold)$(clr 1)$colon$(clr none)"
	fi
}

prompt_fs() {
	local fs=$(stat -f -c %T .)
	if [ "$fs" != "$ROOT_FILESYSTEM" ]; then
		echo -n "[$fs]"
	fi
}

prompt_git() {
	echo -n "$(setLastCommandState && setGitPrompt && echo $PS1)"
}


prompt() {
	PS1="$(prompt_exit_code)"
	PS1="$PS1$(prompt_user)"
	PS1="$PS1$(prompt_colon)"
	PS1="$PS1$(prompt_fs)"
	PS1="$PS1$(prompt_dir)"
	PS1="$PS1$(prompt_git)$ "
}

ROOT_FILESYSTEM="$(stat -f -c %T /)"
GIT_PROMPT_THEME=Custom
GIT_PROMPT_START=" "
GIT_PROMPT_END=" "
GIT_PROMPT_ONLY_IN_REPO=0
GIT_PROMPT_PATH="$HOME/.bash-git-prompt/gitprompt.sh"

if [ -e "$GIT_PROMPT_PATH" ]; then
	. "$GIT_PROMPT_PATH"
fi

PROMPT_COMMAND="prompt"
