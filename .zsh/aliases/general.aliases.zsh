#!/usr/bin/env zsh
#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all general BASH aliases
#
#  For your own benefit, we won't load all aliases in the general, we will
#  keep the very generic command here and enough for daily basis tasks.
#
#  If you are looking for the more sexier aliases, we suggest you take a look
#  into other core alias files which installed by default.
#
#  ---------------------------------------------------------------------------

#   -----------------------------
#   1.  MAKE TERMINAL BETTER
#   -----------------------------

alias cp='cp -iv'                 		# Preferred 'cp' implementation
alias mv='mv -iv'                           	# Preferred 'mv' implementation
alias mkdir='mkdir -p' 				# Preferred 'mkdir' implementation
alias ll='ls -lAFh'                         	# Preferred 'ls' implementation
alias less='less -FSRXc'                    	# Preferred 'less' implementation
alias nano='nano -W'                        	# Preferred 'nano' implementation
alias wget='wget -c'                        	# Preferred 'wget' implementation (resume download)
alias c='clear'                             	# c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         	# path:         Echo all executable Paths
alias show_options='shopt'                  	# Show_options: display bash options settings
alias fix_stty='stty sane'                  	# fix_stty:     Restore terminal settings when screwed up
alias fix_term='echo -e "\033c"'            	# fix_term:     Reset the conosle.  Similar to the reset command
alias cic='set completion-ignore-case On'   	# cic:          Make tab-completion case-insensitive
alias src='source ~/.bashrc'                	# src:          Reload .bashrc file

alias pi='sudo pacman -Sy'
alias pu='sudo pacman -Syyuu'
alias pacpurge='sudo pacman -Rncsudd'
alias pss='pacman -Ss --color=auto'
alias pfs='pacman -F --color=auto'
alias yi='yay -Sy'
alias ys='yay -Ss --color=auto'
alias at='alacritty-themes'
alias kn='kitty @new-window'
#alias spotify='spotify --no-zygote'
alias sshfs-rasp='sshfs pi@raspberrypi:/home/pi -p 6969 /mnt/raspberrypi'
alias battery_percentage='cat /sys/class/power_supply/BAT0/capacity'
alias makemine='sudo chown -R $USER:$USER'

alias py-ani-cli='/home/silentcrafter/Documents/Python/Projects/py-ani-cli/py-ani-cli'

alias ffmpeg='ffmpeg -hide_banner'
alias copy='xclip -selection clipboard'

#alias sudo='doas'                           # Remove the slow-ass shit
alias dotfiles='git --git-dir=/home/silentcrafter/Documents/GitHub/dotfiles/ --work-tree=/home/silentcrafter/'

alias gg='git-get'
alias paheplay='mpv --profile=animepahe'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

alias git-clone='git clone https://github.com/'
alias lsblk='lsblk -o NAME,MAJ:MIN,RM,SIZE,RO,TYPE,FSTYPE,MOUNTPOINTS'
#alias rm='trash -v'
#alias docker='sudo docker'
#alias waifu="curl -s \"$(curl -sL https://nekos.best/api/v2/neko | jq '.[][0].url')\" --output /tmp/waifu.png && nsxiv /tmp/waifu.png && rm /tmp/waifu.png"
#alias wineshell='WINEPREFIX="/home/silentcrafter/Games/Lost Ruins/prefix" wine explorer /desktop=shell,1920x1080'
