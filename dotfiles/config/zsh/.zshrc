# Options
# docs:
# http://zsh.sourceforge.net/Doc/Release/Options.html

setopt nobeep 	   		# Don't beep
setopt autocd 	   		# Implicit cd
setopt correct 			# Autocorrect commands 
setopt correct_all		# Autocorrect arguments 
setopt append_history 		# Append instead of overwrite
setopt hist_expire_dups_first	# Expire duplicates from history first
setopt hist_find_no_dups	# Ignore duplicates when searching history
setopt hist_ignore_dups		# Don't save consecutive history 
setopt hist_reduce_blanks	# Remove blanks from history
setopt hist_verify		# Show history substitution in prompt instead of auto-exec
setopt inc_append_history	# Write to history incrementally (instead of when shell exits)
setopt share_history		# All sessions share history files 

# Env set up
source "$ZDOTDIR/exports.zsh"

# Add Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# Add asdf
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# Use fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Allows aws completions
autoload bashcompinit && bashcompinit

# Allow gh completions
eval "$(gh completion -s zsh)"

# Add direnv
eval "$(direnv hook zsh)"

# Add zgen
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  echo "[info] Saving zgen"

  zgen load junegunn/fzf shell/key-bindings.zsh
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-syntax-highlighting
  zgen oh-my-zsh plugins/colored-man-pages

  # experimental
  zgen load djui/alias-tips

  zgen save
fi

# Reload completions
autoload -Uz compinit
compinit

# Source custom code
source "$ZDOTDIR/custom.zsh"

# Source prompt
source "$ZDOTDIR/prompt.zsh"

# Bindings for zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bindings for zsh-users/zsh-autosuggestions
bindkey ']' autosuggest-accept

