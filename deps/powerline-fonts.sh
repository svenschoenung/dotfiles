#!/usr/bin/env bash

SOURCE="https://github.com/powerline/fonts.git"
TARGET="/tmp/powerline-fonts.$$"

install_bash_git_prompt() {
	git clone "$SOURCE" "$TARGET"
	"$TARGET/install.sh"
	rm -rf "$TARGET"
}

uninstall_bash_git_prompt() {
	rm "$HOME"/.fonts/*[Pp]owerline*
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
