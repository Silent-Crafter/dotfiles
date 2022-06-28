#/usr/bin/env bash

volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

[[ $volume -gt 100 ]] && volume=100

(
echo $volume;
sleep 1;
) |
zenity --progress \
	--text="\tVolume...\t${volume}%" \
	--percentage=$volume \
	--auto-close --no-cancel

