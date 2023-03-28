eval "$(/opt/homebrew/bin/brew shellenv)"
export ZSH="$HOME/.oh-my-zsh"
source "/opt/homebrew/opt/spaceship/spaceship.zsh"
zstyle ':omz:update' mode disabled # Disable automatic updates
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true" # Display red dots whilst waiting for completion.
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
VI_MODE_SET_CURSOR=true
export EDITOR='vim'
export RPS1="%{$reset_color%}" # Disable default "<<<" NORMAL mode indicator in right prompt.
FZF_ALT_C_COMMAND="command fd --type d -E node_modules -E Library -E Desktop -E target -E dist -E .nuxt -E Applications -E coverage -E Documents -E Chrome\ Overrides -E Music -E Public -E Movies -E Pictures"

plugins=(
  alias-finder
  common-aliases
  dirhistory
  fzf
  fzf-tab
  gh
  git
  gitfast
  macos
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
bindkey "^[c" fzf-cd-widget # Option+C to select the folder with FZF and cd to it

### FUNCTIONS ###

# Create a new directory and enter it.
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# Start an HTTP server from a directory, optionally specifying the port.
function server() {
	local port="${1:-8000}";
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Run `dig` and display the most useful info.
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer;
}

function gacp() {
  git add . && git commit -m "$1" && git push
}

function is_yarn() {
  if [[ $(spaceship::upsearch "yarn.lock") ]]; then
    return 0;
  else
    return 1;
  fi
}

function is_npm() {
  if [[ $(spaceship::upsearch "package-lock.json") ]]; then
    return 0
  else
    return 1
  fi
}

# Set SPACESHIP_CHAR_PREFIX to the logo of Node package manager
# on initialisation and after every cd.
function set_char_prefix() {
  SPACESHIP_CHAR_PREFIX=''
  if is_yarn; then SPACESHIP_CHAR_PREFIX=' ' fi
  if is_npm; then SPACESHIP_CHAR_PREFIX="$SPACESHIP_CHAR_PREFIX " fi
}
function chpwd() {
  emulate -L zsh
  set_char_prefix
}
set_char_prefix

# JavaScript Package Manager
function jsp() {
  if is_yarn; then yarn "$@"; else npm "$@"; fi
}
function jspa() {
  if is_yarn; then yarn add "$@"; else npm install "$@"; fi
}

### ALIASES ###

alias cat="bat --theme='Visual Studio Dark+' --style=grid,header"
alias fd="fd -E=node_modules -E=temp -E=.DS_Store --no-ignore-vcs"
alias rm="safe-rm"
alias sed="gsed"

alias ytu="yarn run test:unit"
alias ytw="yarn run test:watch"

alias n="npm"
alias nb="npm run build"
alias nin="npm install"
alias nis="npm install -S"
alias nid="npm install -D"
alias nrun="npm run"
alias nd="npm run dev"
alias nt="npm run test"
alias ntu="npm run test:unit"
alias ntw="npm run test:watch"
alias nln="npm run lint"
alias nlnf="npm run lint --fix"

alias jspin="jsp install"
alias jspb="jsp run build"
alias jspad="jspa -D"
alias jsprun="jsp run"
alias jspd="jsp run dev"
alias jspt="jsp run test"
alias jsptu="jsp run test:unit"
alias jsptw="jsp run test:watch"
alias jspln="jsp run lint"
alias jsplnf="jsp run lint --fix"

alias gamend='git commit --amend --reuse-message=HEAD'
alias gd='git diff-index --quiet HEAD --; git diff --patch-with-stat'
alias gdstat='git diff --stat'
alias gmod='git merge origin/$(git_develop_branch)'
alias glog="git log --oneline --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"

alias ghprvw="gh pr view --web"

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

alias reload="exec $SHELL -l"

### IMPORTANT TO KEEP AT THE END ###

# ~/.extra can be used for other settings you don’t want to commit.
source ~/.extra.zsh
