# Prompt

source /opt/homebrew/opt/gitstatus/gitstatus.plugin.zsh

displaytime() {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%dd ' $D
  [[ $H > 0 ]] && printf '%dh ' $H
  [[ $M > 0 ]] && printf '%dm ' $M
  printf '%ds' $S
}

# Execution time start
prompt_exec_time_preexec_hook() {
  PROMPT_EXEC_TIME_start=$(date +%s)
}

# Execution time end
prompt_exec_time_precmd_hook() {
  typeset -g EXEC_TIME_PROMPT=''

  [[ -n $PROMPT_EXEC_TIME_duration ]] && unset PROMPT_EXEC_TIME_duration
  [[ -z $PROMPT_EXEC_TIME_start ]] && return
  local PROMPT_EXEC_TIME_stop=$(date +%s)
  PROMPT_EXEC_TIME_duration=$(( $PROMPT_EXEC_TIME_stop - $PROMPT_EXEC_TIME_start )) 

  local p

  if [[ $PROMPT_EXEC_TIME_duration -ge 15 ]]; then
    local formatted=$(displaytime $PROMPT_EXEC_TIME_duration)
    p+=" %F{yellow}羽took ${formatted}" 
  fi

  EXEC_TIME_PROMPT="${p}%f"
 
  unset PROMPT_EXEC_TIME_start
  unset PROMPT_EXEC_TIME_duration
}

asdf_prompt_update() {
  [[ -f .tool-versions ]] || return 0 # no asdf

  local p

  if [[ -f mix.exs ]]; then
    local version=${$(asdf current elixir 2> /dev/null)[2]}
    [[ ! $? ]] && return 

    p+=" using %F{magenta} v$version%f"
  fi;

  ASDF_PROMPT="${p}"
}

gitstatus_prompt_update() {
  emulate -L zsh
  typeset -g  GITSTATUS_PROMPT=''
  typeset -gi GITSTATUS_PROMPT_LEN=0

  # Call gitstatus_query synchronously. Note that gitstatus_query can also be called
  # asynchronously; see documentation in gitstatus.plugin.zsh.
  gitstatus_query 'MY'                  || return 1  # error
  [[ $VCS_STATUS_RESULT == 'ok-sync' ]] || return 0  # not a git repo

  local p

  local where  # branch name, tag or commit
  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    where=$VCS_STATUS_LOCAL_BRANCH
  elif [[ -n $VCS_STATUS_TAG ]]; then
    p+='%f#'
    where=$VCS_STATUS_TAG
  else
    p+='%f@'
    where=${VCS_STATUS_COMMIT[1,8]}
  fi

  (( $#where > 32 )) && where[13,-13]="…"  # truncate long branch names and tags
  p+="%F{cyan} ${where//\%/%%}"           # escape %

  # mark if repo is dirty
  (( VCS_STATUS_HAS_UNSTAGED || VCS_STATUS_HAS_UNTRACKED )) && p+="*"

  # mark if staged changes
  (( VCS_STATUS_NUM_STAGED )) && p+="+"

  # repo status (merge, rebase, etc)
  [[ -n $VCS_STATUS_ACTION     ]] && p+=" /${VCS_STATUS_ACTION}/"

  GITSTATUS_PROMPT="on ${p}%f"
}

aws_vault_prompt_update() {
  if [ -z ${AWS_VAULT+x} ]; then
    AWS_VAULT_PROMPT=""
  else
    AWS_VAULT_PROMPT="%F{yellow} ${AWS_VAULT}%f"
  fi
}

# Start gitstatusd instance with name "MY". The same name is passed to
# gitstatus_query in gitstatus_prompt_update. The flags with -1 as values
# enable staged, unstaged, conflicted and untracked counters.
gitstatus_stop 'MY' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'MY'

autoload -Uz add-zsh-hook

# On every prompt, fetch git status and set GITSTATUS_PROMPT.
add-zsh-hook precmd gitstatus_prompt_update

# Add exec_time hooks
add-zsh-hook preexec prompt_exec_time_preexec_hook
add-zsh-hook precmd prompt_exec_time_precmd_hook

# Add asdf hooks
# add-zsh-hook precmd asdf_prompt_update

# Add aws-vault hooks
add-zsh-hook precmd aws_vault_prompt_update

# Enable/disable the right prompt options.
setopt no_prompt_bang prompt_percent prompt_subst

PROMPT='%B%F{240}%(3~|%-1~/…/%2~|%3~)%f%b' 		    # Show smart truncated path
PROMPT+='${GITSTATUS_PROMPT:+ $GITSTATUS_PROMPT}'	# Show git status if available 
PROMPT+=' %(?.%F{magenta}❯.%F{red}❯)%f ' 		      # Shows red on error exit status 

# On right
RPROMPT='${AWS_VAULT_PROMPT}'				              # Shows aws-vault profile
RPROMPT+='${EXEC_TIME_PROMPT}'				              # Shows timing 
