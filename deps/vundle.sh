#!/usr/bin/env bash

SOURCE="https://github.com/gmarik/Vundle.vim.git"
TARGET="$HOME/.vim/bundle/Vundle.vim"

install_bash_git_prompt() {
	git clone "$SOURCE" "$TARGET"
	echo "" | vim +PluginInstall +qall -
}

uninstall_bash_git_prompt() {
	rm -rf "$TARGET"
}

cmd="$1"

case $cmd in
	install)
		install_bash_git_prompt
		;;
	uninstall)
		uninstall_bash_git_prompt
		;;
	reinstall)
		install_bash_git_prompt
		uninstall_bash_git_prompt
		;;
esac
