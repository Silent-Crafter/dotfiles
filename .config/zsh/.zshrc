# =================================================
# XDG_NINJA Recommendations
# =================================================
source $HOME/.profile
# ==================================================


export PATH="$HOME/.local/bin:$PATH"
cowsay $(fortune) | lolcat
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_ALIAS="$HOME/.zsh/aliases"
ZSH_PLUGIN="$HOME/.zsh/plugins"

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle :compinstall filename '/home/silentcrafter/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ===============================================
# =========         PLUGINS            ==========
# ===============================================

typeset -a plg
plg=(
#sudo
	dirhistory
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-history-substring-search
)

for p ("${plg[@]}")
do
	source "${ZSH_PLUGIN}/${p}/${p}.plugin.zsh"
done
unset plg


# ===============================================
# =========         ALIASES            ==========
# ===============================================

typeset -a als
als=(
	general
	ls
)

for a ("${als[@]}")
do
	source "${ZSH_ALIAS}/${a}.aliases.zsh"
done
unset als

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#eval "$(starship init zsh)"

LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
	source "$LFCD"
fi
bindkey -s '^o' 'lfcd\n'

bindkey -s '\e\e' 'sudo !!\n'
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

