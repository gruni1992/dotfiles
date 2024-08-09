export PATH=$HOME/scripts:$PATH
export ZSH="$HOME/.oh-my-zsh"
config pull

ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

