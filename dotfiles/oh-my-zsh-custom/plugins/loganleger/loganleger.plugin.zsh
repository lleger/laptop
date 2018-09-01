# Fast cd to ~/code
c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c

# Fast cd to ~/
h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

# Attach or create tmux session named
# the same as current directory.
tat() {
  current_dir=$(basename $PWD);
  tmux attach -t $current_dir || \
  tmux new -s $current_dir;
}

# Set Textmate as editor
export EDITOR='code --new-window --wait'

# Disable overzealous zsh auto correct
unsetopt correct_all

# Bundler
alias b="bundle"

# Rubygems
alias gi="gem install"
alias giv="gem install -v"

# Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"
alias m="migrate"
alias rk="rake"
alias s="rspec"
alias tlog='tail -f log/development.log'
last_migration() {
  mate db/migrate/$(ls db/migrate/ | sort | tail -1)
}
alias lm='last_migration'

# Git
alias logg="git log --graph --oneline --all --decorate --abbrev-commit"
alias gd='git diff'
alias gbd='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'

# ps
pss() {
	ps aux | ag $1
}

# Save me from myself
alias rm="trash"
