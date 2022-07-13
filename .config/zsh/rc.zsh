export LC_ALL=en_US.UTF-8
export EDITOR='vim'

export CONFIG_HOME=$HOME/.config
export ZSH_CONFIG_ROOT=$CONFIG_HOME/zsh
export VIM_CONFIG_HOME=$CONFIG_HOME/vim

export ZSH=$HOME/.oh-my-zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# ZSH theme + prompt
if [ -f $ZSH_CONFIG_ROOT/theme.zsh ]; then
  source $ZSH_CONFIG_ROOT/theme.zsh
fi

# SSH Identities
if [ -f $ZSH_CONFIG_ROOT/ssh.zsh ]; then
  source $ZSH_CONFIG_ROOT/ssh.zsh
fi

# My useful aliases
if [ -f $ZSH_CONFIG_ROOT/alias.zsh ]; then
    source $ZSH_CONFIG_ROOT/alias.zsh
fi

# secrets
if [ -f $ZSH_CONFIG_ROOT/secrets.zsh ]; then
      source $ZSH_CONFIG_ROOT/secrets.zsh
fi

# Go
export GOPATH="$HOME/go"
export PATH=${GOPATH}/bin:${PATH}
export GO111MODULE=on

# PATH
export PATH="$(python -m site --user-base)/bin:${PATH}"
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$HOME/bin:/bin:/sbin:/usr/X11R6/bin:/usr/games:/usr/local/go/bin:${PATH}
export PATH=$HOME/.cargo/bin:/usr/local/bin:/usr/local/sbin:${PATH}:/usr/local/bin
export PATH=/usr/local/kubebuilder/bin:/usr/bin:/usr/sbin:${PATH}

# BASH Completion
autoload -U +X compinit && compinit
source /usr/local/etc/bash_completion.d/az
source <(kompose completion zsh)

# npm global
export PATH=~/.npm-global/bin:$PATH

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

eval $(dircolors -b $HOME/.dircolors)
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

fpath=($fpath ~/.oh-my-zsh/completions)
