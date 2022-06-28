#!/usr/bin/env bash

function set_color {
  if [[ "${1}" != "-" ]]; then
    fg="38;5;${1}"
  fi
  if [[ "${2}" != "-" ]]; then
    bg="48;5;${2}"
    [[ -n "${fg}" ]] && bg=";${bg}"
  fi
  echo -e "\[\033[${fg}${bg}m\]"
}

SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${green}✓"
SCM_THEME_PROMPT_PREFIX=" ${blue}scm:( "
SCM_THEME_PROMPT_SUFFIX="${blue} )"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${green}✓"
GIT_THEME_PROMPT_PREFIX="${green}git:( "
GIT_THEME_PROMPT_SUFFIX="${green} )"

function git_prompt_info {
  git_prompt_vars
  echo -e "$SCM_PREFIX$SCM_BRANCH$SCM_STATE$SCM_SUFFIX"
}

BATTERY_AC_CHAR=${BATTERY_AC_CHAR:="⚡"}
BATTERY_STATUS_THEME_PROMPT_GOOD_COLOR=70
BATTERY_STATUS_THEME_PROMPT_BAD_COLOR=208
BATTERY_STATUS_THEME_PROMPT_CRITICAL_COLOR=160

function _pro_battery_prompt {
	local color=""
	local battery_status="$(battery_percentage 2> /dev/null)"

	if [[ -z "${battery_status}" ]] || [[ "${battery_status}" = "-1" ]] || [[ "${battery_status}" = "no" ]]; then
		false
	else
		if [[ "${battery_status}" -le 5 ]]; then
			color="${BATTERY_STATUS_THEME_PROMPT_CRITICAL_COLOR}"
		elif [[ "${battery_status}" -le 25 ]]; then
			color="${BATTERY_STATUS_THEME_PROMPT_BAD_COLOR}"
		else
			color="${BATTERY_STATUS_THEME_PROMPT_GOOD_COLOR}"
		fi
		battery_status="${BATTERY_AC_CHAR}${battery_status}"
		echo "$(set_color $color -)${battery_status}%"
	fi
}

function prompt() {
  box_up_left="$(echo -e '\u256d\u2500')"
  box_down_left="$(echo -e '\u2570\u2500 \u3bb')"
  PS1="\n${box_up_left} [$(_pro_battery_prompt)${reset_color}] (${USER}💀\h) : \W $(scm_prompt_info)${reset_color}\n${box_down_left} "
}

safe_append_prompt_command prompt
