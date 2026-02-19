export LC_ALL=en_US.UTF-8
export EDITOR='vim'

export CONFIG_HOME=$HOME/.config
export ZSH_CONFIG_ROOT=$CONFIG_HOME/zsh
export VIM_CONFIG_HOME=$CONFIG_HOME/vim
export ZSH=$HOME/.oh-my-zsh

# Initialize brew completions if available
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Set up fpath
fpath=($fpath ~/.oh-my-zsh/completions)

# Initialize completion system (do this only once)
autoload -Uz compinit
compinit

# Source modular config files
for config_file in config.zsh ssh.zsh alias.zsh secrets.zsh; do
  [[ -f $ZSH_CONFIG_ROOT/$config_file ]] && source $ZSH_CONFIG_ROOT/$config_file
done

# Starship Theme
export STARSHIP_CONFIG="$ZSH_CONFIG_ROOT/starship.toml"
eval "$(starship init zsh)"

# Go
export GOPATH="$HOME/go"
export GO111MODULE=on
export GOBIN=$(go env GOBIN)

# PATH
path=(
  # User bins
  "/opt/homebrew/bin"
  "$HOME/bin"
  "$HOME/.cargo/bin"
  "$HOME/.npm-global/bin"
  "$HOME/.yarn/bin"
  "$HOME/.config/yarn/global/node_modules/.bin"
  "$(python -m site --user-base)/bin"
  "$GOPATH/bin"
  "$GOBIN"
  
  # System bins
  "/usr/local/opt/openjdk@11/bin"
  "/usr/local/opt/ruby/bin"
  "/usr/local/kubebuilder/bin"
  "/usr/local/opt/coreutils/libexec/gnubin"
  "/usr/local/go/bin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/usr/bin"
  "/usr/sbin"
  "/bin"
  "/sbin"
  "/usr/X11R6/bin"
  "/usr/games"
  
  # Keep existing PATH entries
  $path
)

# Remove duplicates from PATH
typeset -U path
export PATH

#eval $(gdircolors -b $HOME/.config/zsh/dircolors.256dark)
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/kalmog/.docker/completions $fpath)
autoload -Uz compinit
compinit

source <(argocd completion zsh)
source <(kargo completion zsh)
