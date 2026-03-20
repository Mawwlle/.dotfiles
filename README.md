# .dotfiles

Terminal-centric dev environment. Python, TypeScript, Elixir. Neovim + Tmux + Zsh.

## Quick install

```bash
curl -fsSL https://raw.githubusercontent.com/Mawwlle/.dotfiles/master/bootstrap.sh | bash
```

Clones the repo to `~/.dotfiles`, installs dependencies, stows configs, bootstraps Neovim plugins.

After install:
- In Neovim run `:PackerSync`, then `:Copilot auth`
- Restart your shell

## What gets installed

**Packages** (brew / apt / dnf):
- `neovim`, `stow`, `git`, `fzf`, `ripgrep`, `python3`, `elixir`
- Node via **nvm** (v22)

**npm LSP servers:**
- `pyright` — Python (strict mode)
- `typescript-language-server` — TypeScript / JavaScript
- `vscode-langservers-extracted` — HTML

## Neovim

Plugin manager: **packer.nvim**
Theme: **Pustota** (dark purple)
Leader: `,`

| Plugin | Purpose |
|---|---|
| `nvim-lsp` | Python, TS, HTML, Elixir |
| `nvim-cmp` + `copilot-cmp` | Completion (LSP + Copilot) |
| `telescope.nvim` | Fuzzy finder |
| `nvim-treesitter` | Syntax highlighting |
| `nvim-dap` + `dap-ui` | Debugger |
| `gitsigns.nvim` | Git blame / hunks |
| `Comment.nvim` | `,cc` / `,c` |

**Key bindings:**

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gv` | Go to definition (vsplit) |
| `K` | Hover docs |
| `<space>rn` | Rename |
| `<space>ca` | Code action |
| `<space>f` | Format |
| `,f` | Find files |
| `,g` | Live grep |
| `<C-h>` | Run Python file |
| `F5/F9/F10/F11` | DAP continue/breakpoint/step |

## Structure

```
~/.dotfiles/
├── .claude/          # Claude Code settings
├── .config/
│   └── nvim/         # Neovim config (init.lua)
├── .zsh_custom/      # Aliases, theme
├── bootstrap.sh      # Fresh-install entry point
└── install.sh        # Idempotent setup script
```

Symlinks managed by **GNU Stow** — `stow --restow .` from `~/.dotfiles`.
