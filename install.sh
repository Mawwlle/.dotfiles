#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

OS="$(uname -s)"
export PATH="$HOME/.local/bin:$PATH"

log() { echo "[install] $*"; }

NVM_VERSION="v0.40.3"
NODE_VERSION="22"

install_nvm() {
    if [ ! -d "$HOME/.nvm" ]; then
        log "Installing nvm $NVM_VERSION..."
        curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh" | bash
    fi
    export NVM_DIR="$HOME/.nvm"
    # shellcheck disable=SC1091
    source "$NVM_DIR/nvm.sh"
    log "Installing Node $NODE_VERSION via nvm..."
    nvm install "$NODE_VERSION"
    nvm use "$NODE_VERSION"
    nvm alias default "$NODE_VERSION"
}

install_packages_macos() {
    if ! command -v brew &>/dev/null; then
        log "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    log "Installing brew packages..."
    brew install \
        git neovim stow \
        python3 \
        fzf ripgrep \
        elixir

    install_nvm
}

install_neovim_linux() {
    local nvim_bin="$HOME/.local/bin/nvim"
    if command -v nvim &>/dev/null; then
        local ver
        ver=$(nvim --version | head -1 | grep -oP '\d+\.\d+' | head -1)
        local major minor
        major=$(echo "$ver" | cut -d. -f1)
        minor=$(echo "$ver" | cut -d. -f2)
        if [ "$major" -gt 0 ] || [ "$minor" -ge 11 ]; then
            log "Neovim $(nvim --version | head -1) already installed, skipping"
            return
        fi
    fi
    log "Installing Neovim stable from GitHub releases..."
    mkdir -p "$HOME/.local/bin" "$HOME/.local/lib"
    curl -fsSL https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
        | tar -xz -C "$HOME/.local/lib"
    ln -sfn "$HOME/.local/lib/nvim-linux-x86_64/bin/nvim" "$nvim_bin"
    export PATH="$HOME/.local/bin:$PATH"
}

install_packages_linux() {
    if command -v apt-get &>/dev/null; then
        sudo apt-get update -q
        sudo apt-get install -y \
            git curl stow \
            python3 python3-pip \
            fzf ripgrep \
            elixir
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y \
            git curl stow \
            python3 python3-pip \
            fzf ripgrep \
            elixir
    else
        echo "Unsupported Linux distro — install packages manually" >&2
        exit 1
    fi

    install_neovim_linux
    install_nvm
}

case "$OS" in
    Darwin) install_packages_macos ;;
    Linux)  install_packages_linux ;;
    *)      echo "Unsupported OS: $OS" >&2; exit 1 ;;
esac


log "Installing LSP servers via npm..."
npm install -g \
    pyright \
    typescript \
    typescript-language-server \
    vscode-langservers-extracted


log "Stowing dotfiles..."
stow --dir="$DOTFILES" --target="$HOME" --restow .


PACKER_DIR="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [ ! -d "$PACKER_DIR" ]; then
    log "Cloning packer.nvim..."
    git clone --depth=1 https://github.com/wbthomason/packer.nvim "$PACKER_DIR"
fi

log "Installing Neovim plugins (headless)..."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

log "Done. Restart your shell."
