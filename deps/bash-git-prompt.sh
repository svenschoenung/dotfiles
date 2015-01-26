#!/usr/bin/env bash

SOURCE="https://github.com/magicmonty/bash-git-prompt.git"
TARGET="$HOME/.bash-git-prompt"

bash_git_prompt_install() {
	git clone "$SOURCE" "$TARGET"
}

bash_git_prompt_uninstall() {
	rm -rf "$TARGET"
}

bash_git_prompt_abort() {
	echo "Usage: bash_git_prompt (install|uninstall)"
	exit 1
}

cmd="bash_git_prompt_$1"; shift
if [ "$(type -t "$cmd")" == "function" ]; then
	$cmd $*
else
	bash_git_prompt_abort
fi
