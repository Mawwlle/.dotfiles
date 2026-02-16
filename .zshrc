# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"



export PATH="/usr/local/bin:$HOME/bin:$PATH"
zstyle ':omz:update' mode auto      # update automatically without asking

zstyle ':omz:update' frequency 14
plugins=(git poetry fzf)

source $ZSH/oh-my-zsh.sh
export ZSH_CUSTOM="$HOME/.zsh_custom"


export EDITOR='nvim'
source $ZSH_CUSTOM/aliases.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Notification function for long-running commands
notify() {
  "$@"
  local exit_code=$?
  if [ $exit_code -eq 0 ]; then
    terminal-notifier -title "✓ $1" -message "Command finished successfully" -sound Glass -execute "/Users/mawwlle/.local/bin/focus-claude-tab.sh"
  else
    terminal-notifier -title "✗ $1" -message "Command failed with code $exit_code" -sound Glass -execute "/Users/mawwlle/.local/bin/focus-claude-tab.sh"
  fi
  return $exit_code
}


export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
