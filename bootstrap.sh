#!/usr/bin/env bash
set -euo pipefail

REPO="https://github.com/Mawwlle/.dotfiles.git"
DOTFILES="$HOME/.dotfiles"

log() { echo "[bootstrap] $*"; }

if [ ! -d "$DOTFILES" ]; then
    log "Cloning dotfiles..."
    git clone "$REPO" "$DOTFILES"
else
    log "Dotfiles already cloned, pulling latest..."
    git -C "$DOTFILES" pull --ff-only
fi

bash "$DOTFILES/install.sh"
