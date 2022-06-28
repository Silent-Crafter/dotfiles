
# Find and install a pkg (command) if it isn't installed

command_not_found_handle() {
	local CMD="$1"

	echo -n "bash: command \"$CMD\" not found. Search and install? [y/N]: ">&2
	read choice
	choice=${choice:-n}

	if [[ "$choice" != *[yY]* ]]; then
		return 127
	fi

	local PKGS=$(pacman -Fq $CMD)

	if [[ -z $PKGS ]]; then
		echo "$0: command \"$CMD\" not found">&2
		return 127
	else
		case $(echo ${PKGS} | wc -w) in
		1)	echo -e "\nInstalling $PKGS..."
			sudo pacman -Sy $PKGS ;;
			
		*)	local PS3="Select a pkg: "
			select PKG in $PKGS
			do
			break
			done ;;
		esac
	fi

	return 0
}
