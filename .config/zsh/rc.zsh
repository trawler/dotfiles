# Locale settings
export LC_ALL=en_US.UTF-8

# Editor defaults
export EDITOR=${EDITOR:-vim}
export GIT_EDITOR=${GIT_EDITOR:-vim}

# Configuration paths
export CONFIG_HOME=$HOME/.config
export ZSH_CONFIG_ROOT=$CONFIG_HOME/zsh
export VIM_CONFIG_HOME=$CONFIG_HOME/vim
export ZSH=$HOME/.oh-my-zsh

# Homebrew completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
    autoload -Uz compinit
    compinit
fi

# Source configuration files
for config_file in theme ssh alias secrets; do
    [[ -f $ZSH_CONFIG_ROOT/${config_file}.zsh ]] && source $ZSH_CONFIG_ROOT/${config_file}.zsh
done

# Go configuration
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export GO111MODULE=on

# Consolidated PATH
typeset -U path  # Ensure PATH contains no duplicates
path=(
    $HOME/bin
    $HOME/.cargo/bin
    $HOME/.npm-global/bin
    $HOME/.yarn/bin
    $HOME/.config/yarn/global/node_modules/.bin
    $GOPATH/bin
    /usr/local/go/bin
    /usr/local/bin
    /usr/local/sbin
    /usr/local/opt/openjdk@11/bin
    /usr/local/kubebuilder/bin
    /usr/bin
    /usr/sbin
    /bin
    /sbin
    $(python -m site --user-base)/bin
    $path
)
export PATH

# ZSH completion
autoload -U +X compinit && compinit
fpath=($fpath ~/.oh-my-zsh/completions)

# Google Cloud SDK
for gcloud_config in path.zsh.inc completion.zsh.inc; do
    [[ -f "$HOME/google-cloud-sdk/${gcloud_config}" ]] && source "$HOME/google-cloud-sdk/${gcloud_config}"
done

eval $(gdircolors ~/.config/zsh/dircolors.256dark)
