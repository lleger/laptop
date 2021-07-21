## Functions

# Fast cd to ~/code
c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c

# Fast cd to ~/
h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

# ps search
pss() {
  ps aux | rg $1
}

# Attach or create tmux session named the same as current directory
tat() {
  current_dir=$(basename $PWD);
  tmux attach -t $current_dir || \
  tmux new -s $current_dir;
}

# Open psql with dev database
psd() {
  if [[ ! -f mix.lock ]]; then
    return 1
  fi
  db=$(rg -o --no-line-number --color never -r '$1' 'database:[\s*]"([A-z_]+)",$' config/dev.exs)
  psql -d $db
}

# Open psql with test database
pst() {
  if [[ ! -f mix.lock ]]; then
    return 1
  fi
  db=$(rg -o --no-line-number --color never -r '$1' 'database:[\s*]"([A-z_]+)#\{[A-z._"()]+}",' config/test.exs)
  psql -d $db
}

## Aliases

alias ls="lsd"
alias ll="lsd -al"
alias weather="clear; curl wttr.in/Baton+Rouge"
alias zconfig="$EDITOR $ZDOTDIR/.zshrc"
alias zsource="source $ZDOTDIR/.zshrc"
alias vim="nvim"

# git

git_default_branch() {
  local origin
  origin=$(command git remote show origin 2> /dev/null)

  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return # not a git repo
  fi

  origin=$(echo $origin | grep 'HEAD branch' | cut -d' ' -f5) || return
  echo $origin
}

git_fixup() {
  git commit --amend --no-edit
}

alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gca="git commit -a"
alias gcf="git commit --fixup"
alias gco="git checkout"
alias gcm="git checkout $(git_default_branch)"
alias gd="git diff"
alias gf="git fetch"
alias gfu="git_fixup"
alias gl="git pull"
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glogs="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias gp="git push"
alias grb="git rebase"
alias grbim="git rebase -i origin/$(git_default_branch)"
alias grcd='cd $(git root)'
alias gst="git status"
alias gundo="git reset HEAD~"
alias gunwip='git log -n 1 | grep -q -c "WIP [skip ci]" && git reset HEAD~1'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "WIP [skip ci]"'

# Save me from myself
alias rm="trash"

# Use bat instead of cat
alias cat="bat"
alias pcat="/bin/cat"

# Use lsd instead of ls
alias ls="lsd"

# Elixir
alias ixx="iex -S mix"
alias mc="mix compile"
alias mcw="mix compile --warnings-as-errors"
alias mdg="mix deps.get"

# Phoenix
alias em="mix ecto.migrate && mix ecto.rollback && mix ecto.migrate"
alias mpxs="mix phx.server"

# The Cloud
alias giga="gigalixir"

## Bindings

bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→
