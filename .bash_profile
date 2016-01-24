# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin" 

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# Load the shell dotfiles:
for file in ~/.{prompt,exports,alias,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Tab completion for Git commands and branch names (with aliases)
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash

  __git_complete g __git_main
  __git_complete get __git_main
  __git_complete got __git_main
  __git_complete gs _git_status
  __git_complete ga _git_add
  __git_complete gb _git_branch
  __git_complete gc _git_commit
  __git_complete gp _git_push
  __git_complete gr _git_remote
  __git_complete gd _git_diff
  __git_complete gf _git_fetch
  __git_complete go _git_checkout
fi
