eval "$(/opt/homebrew/bin/brew shellenv)"
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode disabled # Disable automatic updates
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true" # Display red dots whilst waiting for completion.
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
VI_MODE_SET_CURSOR=true
export EDITOR='vim'
export RPS1="%{$reset_color%}" # Disable default "<<<" NORMAL mode indicator in right prompt.
export LSCOLORS=ExFxCxDxBxegedabagacad
FZF_ALT_C_COMMAND="command fd --type d -E node_modules -E Library -E Desktop -E target -E dist -E .nuxt -E Applications -E coverage -E Documents -E Chrome\ Overrides -E Music -E Public -E Movies -E Pictures"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

plugins=(
  common-aliases
  fzf
  fzf-tab
  gitfast
  npm
  safe-paste
  vi-mode
  volta
  yarn
  zsh-autosuggestions
  zsh-interactive-cd
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

### KEY BINDINGS ###

bindkey '^[[1;5C' autosuggest-execute # Ctrl+RightArrow to accept and execute autosugges
bindkey "^[[1;3D" backward-word # Option+LeftArrow for previous word
bindkey "^[[1;3C" forward-word # Option+RightArrow for next word
bindkey "^H" backward-delete-word # Option+Backspace to delete previous word in WezTerm
bindkey "^W" backward-delete-word # Option+Backspace to delete previous word
bindkey "^A" vi-beginning-of-line # Cmd+LeftArrow to navigate to beginning of line in VSCode
bindkey "^[[1;2D" vi-beginning-of-line # Cmd+LeftArrow to navigate to beginning of line in WezTerm
bindkey "^E" end-of-line # Cmd+RightArrow to navigate to end of line in VSCode
bindkey "^[[1;2C" end-of-line # Cmd+RightArrow to navigate to end of line in VSCode
bindkey "^R" fzf-history-widget # Ctrl+R for history search

### FUNCTIONS ###

# Create a new directory and enter it.
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# Start an HTTP server from a directory, optionally specifying the port.
function server() {
	python3 -m 'http.server' 8000;
}

# Run `dig` and display the most useful info.
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer;
}

### ALIASES ###

alias ls="ls -Gh"
alias lsa="ls -A" # all files inc dotfile
alias lsl="ls -lF" # all files, in long format
alias lsla="ls -lAF" # all files inc dotfiles, in long format

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias cat="bat --theme='Visual Studio Dark+' --style=grid,header"
alias fd="fd -E=node_modules -E=temp -E=.DS_Store --no-ignore-vcs"
alias rm="safe-rm"
alias sed="gsed"

alias origin='git remote get-url origin | xargs open'
alias ghpr="gh pr view --web"

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

alias reload="exec $SHELL -l"

### IMPORTANT TO KEEP AT THE END ###

# ~/.extra can be used for other settings you don’t want to commit.
source ~/.extra.zsh
