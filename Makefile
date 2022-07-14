
.PHONY: all install-brew install-brew-pkgs

all: install-brew install-brew-pkgs

install-brew:
	sudo true # this will invoke a password prompt
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sudo -u $$USER /bin/bash

install-brew-pkgs:
	brew bundle --file=./.config/brew/Brewfile

oh-my-zsh:
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

vim:
	vim +PluginInstall +qall
	vim +PlugInstall +qall
