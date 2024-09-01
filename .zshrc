export PATH=$HOME/scripts:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
source scripts/functions
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config pull
