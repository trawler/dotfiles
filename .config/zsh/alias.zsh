alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimconfig='vim ~/.vimrc'
alias update="source ~/.zshrc"
alias pro="cd documents/project/"
alias opensource="cd documents/project/Open\ Source"
alias appren="cd /documents/project/Apprehenticeship"
alias personal="cd /document/project/Personal\ Projects"
alias ls='gls --color=auto -p'
alias ll='ls -al'
alias gr='git fetch --all && git reset --hard origin/master; git pull && git submodule update --init && git clean -fdx'
alias grebase='git fetch upstream master && git rebase upstream/master'
alias gmerge='git fetch upstream && git checkout master && git merge upstream/master'
alias gtags='gotags -tag-relative=true -R=true -sort=true -f="tags" -fields=+l .'
alias ggraph='git log --graph --full-history --all --color \
            --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias python="/usr/local/bin/python3"
local ret_status="%(?:%{$fg[yellow]%}=> :%{$fg[red]%}=> %s)"

