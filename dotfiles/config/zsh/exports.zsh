export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# React Native Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Save IEx history
export ERL_AFLAGS="-kernel shell_history enabled"

# Disable Erlang Java dependency
export KERL_CONFIGURE_OPTIONS="--without-javac"

# Configure editors
export EDITOR="NVIM_STYLE=lo-fi nvim"
export PLUG_EDITOR="NVIM_STYLE=lo-fi nvim __FILE__ -c ':__LINE__"
export ECTO_EDITOR="$EDITOR"

# Configure aws-vault
export AWS_VAULT_KEYCHAIN_NAME="login"

# Use `rg` with `fzf`
export FZF_DEFAULT_COMMAND="rg --files --hidden"

