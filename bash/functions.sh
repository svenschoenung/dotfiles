add_to_path() {
	local path="$1"
	if [[ "$PATH" != *"$path"* ]]; then
		export PATH="$path:$PATH"
	fi
}
