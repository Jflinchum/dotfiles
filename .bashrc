# OSX Bash Deprecation Notice
export BASH_SILENCE_DEPRECATION_WARNING=1

# NVM
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

# PS1 Customization
export PS1="\[\e[1;31m\]\u@\h \w$ \[\e[m\]"

# Git Completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Aliases
alias beep="echo -e '\007'"
alias gpom="git pull origin master"
alias gbranch="git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias gnochance="git update-index --assume-unchanged"
