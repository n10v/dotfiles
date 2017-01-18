export EDITOR=vim
export GOPATH=$HOME/go
export GOROOT=$HOME/.gostable
export GOROOT_BOOTSTRAP=$HOME/.gobootstrap
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
set -o vi
export HISTSIZE=3000

# bash completion
bash_prefix=$(brew --prefix)
if [ -f $bash_prefix/etc/bash_completion ]; then
	. $bash_prefix/etc/bash_completion
fi

# Append to history
shopt -s histappend
PROMPT_COMMAND='history -a'

# ls colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Ignore duplicates and ls, bg ,fg, exit in history
export HISTCONTROL="ignoredups"
export HISTIGNORE="&:ls:[bf]g:exit"

# Correct cd mispells
shopt -s cdspell

# Aliases
alias y=youtube-dl
alias n=nehm
alias v=vnehm

export PS1="(\h) \[\e[34m\]\W\[\e[m\] "
