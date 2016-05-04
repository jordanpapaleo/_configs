# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
source /Users/jp/.rvm/scripts/rvm

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# This loads NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh 

# shows git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
