export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

plugins=(git poetry fzf zsh-syntax-highlighting)

source "$ZSH/oh-my-zsh.sh"

export ZSH_CUSTOM="$HOME/.zsh_custom"
export EDITOR='nvim'
export PATH="$HOME/.local/bin:$PATH"

source "$ZSH_CUSTOM/aliases.zsh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# macOS extras
if [ "$(uname -s)" = "Darwin" ]; then
    export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
    export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
fi
