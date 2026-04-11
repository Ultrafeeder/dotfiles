#
# ~/.bashrc
#
source /home/ultrafeeder4/git-prompt.sh
source /home/ultrafeeder4/aliases.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'
alias grep='grep --color=auto'
CLR_DIV="\[\033[0m\]"
CLR_LPAREN="\[\033[0m\] "
CLR_RPAREN="\[\033[0m\]  "

USR_COLOR="\[\033[0;36m󰯉 \u\]"
COM_COLOR="\[\033[0;34m󰐝 \h\]"
PWD_COLOR="\[\033[1;33m \w\]"
CMD_COLOR="\[\033[0m"
PROMPT="┎${CLR_LPAREN}${USR_COLOR} ${COM_COLOR}${CLR_RPAREN}${CLR_LPAREN}\@${CLR_RPAREN}${CLR_DIV}\n┠${CLR_LPAREN}${PWD_COLOR}${CLR_RPAREN}"
END_PROMPT="\n${CMD_COLOR}\]┖─►\$: " 
export PATH="$PATH:/home/ultrafeeder4/.local/bin"
export PROMPT_COMMAND='__posh_git_ps1 "${PROMPT}" "${END_PROMPT}";' $PROMPT_COMMAND

eval "$(ssh-agent)"
eval "$(direnv hook bash)"


