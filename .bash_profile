# Set vi keys for bash.
set -o vi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# bash completion.
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

# Case-insensitive globbing (used in pathname expansion).
shopt -s nocaseglob

# Append to history.
shopt -s histappend

# Correct cd mispells.
shopt -s cdspell

