
.PHONY: all install-brew install-brew-pkgs oh-my-zsh vim

all: install-brew install-brew-pkgs

install-brew:
	sudo true # this will invoke a password prompt
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sudo -u $$USER /bin/bash

install-brew-pkgs:
	brew bundle --file=./.config/brew/Brewfile

oh-my-zsh:
	cd ~
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

vim:
	cd ~
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	brew link vim # make sure we use brew version
	vim +PluginInstall +qall
	vim +PlugInstall +qall

fonts:
	git clone https://github.com/powerline/fonts.git --depth=1
	cd fonts && ./install.sh

clean:
	-rm -rf fonts
