export UPDATE_ZSH_DAYS=1
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  asdf
  kubectl
  kops
  golang
  ssh-agent
  git
  iterm2
  helm
  zsh-helmfile
  npm
  bazel
  docker
  docker-compose
  z
  bundler
  dotenv
  macos 
  rake
  rbenv
  ruby
  jsontools
  node
  pip
  web-search
  zsh-autosuggestions
  colored-man-pages
  colorize
  common-aliases
  copyfile
)

export ENABLE_CORRECTION="false"
source $ZSH/oh-my-zsh.sh
