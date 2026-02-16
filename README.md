# Dotfiles Configuration

Comprehensive documentation of my development environment setup.

## Table of Contents

- [Overview](#overview)
- [Directory Structure](#directory-structure)
- [Core Configurations](#core-configurations)
- [Development Tools](#development-tools)
- [Editor Configurations](#editor-configurations)
- [Terminal & Shell](#terminal--shell)
- [macOS Integration](#macos-integration)
- [Project Management](#project-management)
- [Installation & Management](#installation--management)

## Overview

This repository contains my personal dotfiles optimized for full-stack development with a terminal-centric workflow. The setup emphasizes:

- **Consistent theming**: Pustota purple color scheme across Neovim and Tmux
- **Efficient navigation**: Custom aliases and hotkeys for rapid workflow
- **LSP-powered development**: Language servers for Python, JavaScript, and more
- **Session management**: Tmuxinator templates for complex multi-service projects
- **GNU Stow**: Symlink management for clean dotfile deployment

**Primary Stack**: Python, JavaScript/Node.js, with support for Java and Flutter

## Directory Structure

```
.dotfiles/
├── .config/                    # XDG-compliant application configs
│   ├── configstore/           # Configuration storage
│   ├── flutter/               # Flutter SDK state
│   ├── git/                   # Git global configuration
│   ├── htop/                  # System monitor settings
│   ├── iterm2/                # iTerm2 terminal settings
│   ├── marimo/                # Marimo notebook config
│   ├── nvim/                  # Neovim configuration
│   ├── skhd/                  # macOS hotkey daemon
│   ├── tmuxinator/            # Tmux session templates
│   ├── uv/                    # UV package manager
│   └── zed/                   # Zed editor settings
├── .local/share/              # Local data (nvim packages)
├── .zsh_custom/               # Custom zsh extensions
│   ├── aliases.zsh           # Command aliases
│   └── sobole-zsh-theme/     # Custom zsh theme
├── .tmux.conf                 # Tmux configuration (72 lines)
├── .zshrc                     # Zsh configuration (31 lines)
├── .gitignore                 # Git ignore patterns
└── .stow-global-ignore        # GNU Stow metadata
```

## Core Configurations

### Shell (.zshrc)

**Location**: `/Users/mawwlle/.dotfiles/.zshrc` (31 lines)

**Framework**: Oh My Zsh

**Theme**: Robbyrussell

**Plugins**:
- `git` - Git aliases and functions
- `poetry` - Python Poetry integration
- `fzf` - Fuzzy finder for command history and files

**Environment Setup**:
- NVM (Node Version Manager) for Node 22
- Java 17 (OpenJDK) configured
- Homebrew package manager paths
- Syntax highlighting via zsh-syntax-highlighting

### Custom Aliases (.zsh_custom/aliases.zsh)

**Location**: `/Users/mawwlle/.dotfiles/.zsh_custom/aliases.zsh`

**Editor**:
```bash
alias e='nvim'              # Quick editor launch
alias pe='poetry run nvim .' # Poetry-managed editor
```

**Navigation**:
```bash
alias smile='cd ~/code/smile'           # SMILE project
alias gocode='cd ~/code'                # Code directory
alias goprj='cd ~/code/projects'        # Projects directory
```

**Utilities**:
```bash
alias l='ls -lah'           # Detailed list view
alias c='clear'             # Clear terminal
alias dps='docker ps'       # Docker processes
```

## Development Tools

### Python

**LSP**: Pyright with strict type checking
**Package Managers**:
- Poetry (dependency management)
- UV v0.9.11 (fast package installer)

**Neovim Integration**: Ctrl+H runs Python files directly

### JavaScript/Node.js

**Version Manager**: NVM (Node 22)
**Package Managers**: Yarn, npm

### Java

**Version**: OpenJDK 17
**Environment**: JAVA_HOME configured in .zshrc

### Flutter

**State File**: `/Users/mawwlle/.dotfiles/.config/flutter/tool_state`
**Usage**: Mobile development framework

### Other Tools

**Marimo**: Interactive Python notebook environment
- Config: `/Users/mawwlle/.dotfiles/.config/marimo/marimo.toml`

**Git**:
- Global ignore: `/Users/mawwlle/.dotfiles/.config/git/ignore`

## Editor Configurations

### Neovim

**Location**: `/Users/mawwlle/.dotfiles/.config/nvim/init.lua` (159 lines)

**Plugin Manager**: Packer (16 plugins installed)

**Color Scheme**: Pustota (dark purple theme)
- Alternative themes: Kanagawa, Gruvbox, Gruvbox Material

**Key Plugins**:
- `telescope.nvim` - Fuzzy file finder
- `nvim-lspconfig` - LSP integration
- `nvim-cmp` - Autocompletion engine
- `nvim-treesitter` - Advanced syntax highlighting
- `Comment.nvim` - Toggle comments easily
- `auto-save.nvim` - Automatic file saving
- `nvim-tree.lua` - File explorer
- `lualine.nvim` - Status line
- `gitsigns.nvim` - Git integration
- `null-ls.nvim` - Formatters and linters

**Keybindings**:
- Leader key: `,` (comma)
- `Ctrl+H` - Run Python file
- LSP: goto definition, references, hover, rename, etc.

**LSP Configuration**:
- **Pyright** (Python): Strict type checking, auto-imports
- Completion with snippets support
- Diagnostic signs in gutter

**Settings**:
- Relative line numbers
- Tab = 2 spaces
- Auto-indent enabled
- Mouse support
- Persistent undo
- Case-insensitive search (smart case)

### Zed Editor

**Location**: `/Users/mawwlle/.dotfiles/.config/zed/settings.json`

**Features**:
- Vim mode enabled
- Font sizes: UI 16pt, Buffer 15pt
- Theme: System-aware (Gruvbox Dark light, One Dark dark)

**Extended Config**:
- `/Users/mawwlle/.dotfiles/.config/zed/conversations/` - Conversation history
- `/Users/mawwlle/.dotfiles/.config/zed/prompts/` - Custom prompts
- `/Users/mawwlle/.dotfiles/.config/zed/themes/` - Theme definitions

## Terminal & Shell

### Tmux Configuration

**Location**: `/Users/mawwlle/.dotfiles/.tmux.conf` (72 lines)

**Color Scheme**: Dark purple Pustota-inspired palette (matches Neovim)

**Visual Customization**:
- Status bar: Session name and time display
- Active pane borders: Highlighted in purple
- Window status: Orange for active, gray for inactive
- 256-color terminal with true color support

**Features**:
- Mouse support enabled
- Improved pane navigation
- Custom status line format

**Color Palette**:
```
Background: #1a1a1a (dark gray)
Foreground: #d4d4d4 (light gray)
Active border: #9d79d6 (purple)
Active window: #ff9800 (orange)
Status bar: Purple/gray theme
```

### iTerm2

**Location**: `/Users/mawwlle/.dotfiles/.config/iterm2/`
- Symlinks to `~/Library/Application Support/iTerm2/`
- macOS terminal application integration

### Htop

**Location**: `/Users/mawwlle/.dotfiles/.config/htop/htoprc`
- System process monitoring configuration

## macOS Integration

### Skhd (Hotkey Daemon)

**Location**: `/Users/mawwlle/.dotfiles/.config/skhd/skhdrc`

**Modifier**: `Ctrl+Cmd+{key}`

**Application Launchers**:
```
Ctrl+Cmd+L → Visual Studio Code
Ctrl+Cmd+K → iTerm
Ctrl+Cmd+J → Google Chrome
Ctrl+Cmd+O → Zed
Ctrl+Cmd+T → Telegram
Ctrl+Cmd+H → Finder
```

**Additional Integration**:
- Warp terminal (modern terminal with hotkey support)

## Project Management

### Tmuxinator

**Location**: `/Users/mawwlle/.dotfiles/.config/tmuxinator/`

**SMILE Project Configuration**:

Two variants available:
1. **smile.yml** - Staging environment
2. **smile-streaming.yml** - Streaming variant

**Service Windows**:

**calculations**:
- Backend API server with hot-reload
- Celery worker for async task processing

**gateway**:
- FastAPI gateway service
- API development server

**graph**:
- Django-based graph service
- Development server with auto-reload

**frontend**:
- Yarn-based frontend development server
- React/Next.js application

**RabbitMQ Handler** (streaming variant):
- Event streaming and message queue processing

**Stack Technologies**:
- Django (Python web framework)
- FastAPI (Modern Python API framework)
- Celery (Distributed task queue)
- RabbitMQ (Message broker)
- Yarn (JavaScript package manager)
- React/Next.js (Frontend framework)

## Installation & Management

### GNU Stow

**Metadata File**: `/Users/mawwlle/.dotfiles/.stow-global-ignore`

**Ignored Patterns**:
- VCS files: `.git`, `.gitignore`, `.hg`
- Backup files: `~`, `.swp`, `.swo`
- Compiled Neovim plugins
- Zed/Tmuxinator cache
- README and LICENSE files

**Usage**:
```bash
# From .dotfiles directory
stow .  # Create symlinks for all configs
```

### Git Repository Status

**Current Branch**: master
**Main Branch**: master

**Modified Files**:
- `nvim/init.lua`
- `../.tmux.conf`
- `../.zsh_custom/aliases.zsh`
- `../.zshrc`

**Untracked Directories**:
- `configstore/`, `flutter/`, `git/`, `htop/`, `iterm2/`
- `marimo/`, `skhd/`, `uv/`, `../.local/`, `../.zsh_custom/sobole-zsh-theme/`

**Recent Commits**:
```
da05f7e - (feat): tmux coloring
02721aa - (feat): tmux config
0b50ff3 - (fix): pure neovim config
fae08e2 - (fix): remove packer compiled file
c674b8d - (feat): added nice autocomplete and other settings
```

## Quick Start Guide

### Initial Setup

```bash
# Clone repository
git clone <repo-url> ~/.dotfiles
cd ~/.dotfiles

# Install with stow
stow .

# Install Oh My Zsh (if not already installed)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Neovim plugins
nvim +PackerSync
```

### Common Workflows

**Start SMILE project**:
```bash
tmuxinator start smile
```

**Quick navigation**:
```bash
smile      # Jump to SMILE project
gocode     # Jump to code directory
e          # Open Neovim
```

**Application launching**:
- `Ctrl+Cmd+L` - VS Code
- `Ctrl+Cmd+K` - iTerm
- `Ctrl+Cmd+O` - Zed

## System Requirements

- **OS**: macOS (Darwin 25.2.0)
- **Shell**: Zsh with Oh My Zsh
- **Terminal**: iTerm2, Warp, or compatible
- **Package Manager**: Homebrew
- **Fonts**: Nerd Fonts recommended for icons

## Theme Consistency

The setup maintains visual consistency across tools:

**Pustota Color Scheme**:
- Neovim primary theme
- Tmux status bar and borders
- Purple (`#9d79d6`) and orange (`#ff9800`) accent colors
- Dark background (`#1a1a1a`) throughout

**Alternative Themes Available**:
- Gruvbox (warm, retro)
- Gruvbox Material (refined Gruvbox)
- Kanagawa (Japanese-inspired)
- One Dark (VS Code style)

---

**Last Updated**: 2026-02-09
**Platform**: macOS (Darwin 25.2.0)
**Maintained By**: mawwlle
