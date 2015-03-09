#!/usr/bin/env bash

SOURCE="https://github.com/flatland/drip.git"
TARGET="$HOME/.drip.git"
TARGET_BIN="$HOME/bin"

drip_install() {
	git clone "$SOURCE" "$TARGET"
	cd "$TARGET"
	make "prefix=$TARGET_BIN" install
	cd -
}

drip_uninstall() {
	rm "$TARGET_BIN/drip"
	rm -rf "$TARGET"
}

drip_abort() {
	echo "Usage: drip (install|uninstall)"
	exit 1
}

cmd="drip_$1"; shift
if [ "$(type -t "$cmd")" == "function" ]; then
	$cmd $*
else
	drip_abort
fi
