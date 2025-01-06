# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"



zstyle ':omz:update' mode auto      # update automatically without asking

zstyle ':omz:update' frequency 14
plugins=(git poetry fzf)

source $ZSH/oh-my-zsh.sh
export ZSH_CUSTOM="$HOME/.zsh_custom"


export EDITOR='nvim'
source $ZSH_CUSTOM/aliases.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
