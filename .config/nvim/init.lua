vim.opt.mouse = "a" -- Enable mouse support
vim.opt.encoding = "utf-8" -- Общая кодировка (необязательно, по умолчанию UTF-8)
vim.opt.fileencoding = "utf-8" -- Кодировка файлов
vim.opt.clipboard = "unnamedplus" -- Используем системный буфер
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers for better vim motions
vim.opt.swapfile = false -- Disable .swp files
vim.opt.tabstop = 4 -- Spaces instead of one tab
vim.opt.softtabstop = 4 -- Spaces instead of one tab
vim.opt.shiftwidth = 4 -- Spaces for auto indent
vim.opt.expandtab = true -- Replace tab with spaces
vim.opt.autoindent = true -- Save indent on new line
vim.opt.fileformat = "unix"
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Search settings
vim.opt.ignorecase = true -- Case-insensitive search
vim.opt.smartcase = true -- Case-sensitive if uppercase used
vim.opt.incsearch = true -- Show matches as you type
vim.opt.hlsearch = true -- Highlight search results

-- Scroll and cursor
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right

-- Performance
vim.opt.updatetime = 250 -- Faster completion & diagnostics
vim.opt.timeoutlen = 300 -- Faster key sequence timeout

-- Persistent undo
vim.opt.undofile = true -- Enable persistent undo
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'

vim.g.mapleader = ',' 

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    callback = function()
        vim.opt.colorcolumn = '88'
        vim.keymap.set('n', '<C-h>', ':w<CR>:!python3 %<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!python3 %<CR>', { buffer = true, silent = true })
    end
})

vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('n', ',<Space>', ':nohlsearch<CR>', { noremap = true })
vim.keymap.set('n', 'H', 'gT', { noremap = true }) -- Переключение вкладок
vim.keymap.set('n', 'L', 'gt', { noremap = true })
vim.keymap.set('n', ',f', ':Telescope find_files<CR>', { noremap = true })
vim.keymap.set('n', ',g', ':Telescope live_grep<CR>', { noremap = true })
vim.keymap.set('n', 'gw', ':bp|bd #<CR>', { noremap = true, silent = true })

-- Better buffer navigation
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

-- Window navigation (using Alt to avoid conflict with C-h for Python)
vim.keymap.set('n', '<M-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<M-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<M-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<M-l>', '<C-w>l', { noremap = true })

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim' -- For Telescope plugin
    use 'hrsh7th/nvim-cmp' -- Autocomplete
    use 'hrsh7th/cmp-nvim-lsp'

    use 'morhetz/gruvbox' -- Color schemes
    use 'sainnhe/gruvbox-material'
    use 'rebelot/kanagawa.nvim'
    use 'pustota-theme/pustota.nvim'

    -- Comment/uncomment by gcc for current line of gc for seleted lines
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({
            -- Включить/отключить добавление пробела после символа комментария
            padding = true,
            -- Переназначаем ключевые привязки
            toggler = {
                line = ',cc',  -- Закомментировать строку (вместо 'gcc')
                block = ',cb', -- Закомментировать блок (вместо 'gbc')
            },
            opleader = {
                line = ',c',   -- Закомментировать строки в визуальном режиме (вместо 'gc')
                block = ',b',  -- Закомментировать блоки в визуальном режиме (вместо 'gb')
            },
        })
      end
    }

    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzf-native.nvim'
    use 'Pocco81/auto-save.nvim' -- Автосохранение

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                current_line_blame = true, -- Show blame on current line
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 300,
                },
                current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            })
        end
    }

    -- DAP (Debug Adapter Protocol)
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'nvim-neotest/nvim-nio'
    use 'mfussenegger/nvim-dap-python'
    use 'theHamsta/nvim-dap-virtual-text'
end)

vim.cmd([[colorscheme pustota]]) -- kanagawa-wave, kanagawa-dragon, kanagawa-lotus

-- LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP Keybindings (set up on LspAttach)
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)

        -- Go to definition in vertical split
        vim.keymap.set('n', 'gv', function()
            vim.cmd('vsplit')
            vim.lsp.buf.definition()
        end, opts)
    end
})

-- Настройка LSP для Python (Pyright)
vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'pyrightconfig.json', '.git' },
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "strict",
                diagnosticSeverityOverrides = {
                    reportUnusedVariable = "warning",
                },
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
            },
        },
    },
})

-- Enable Pyright LSP
vim.lsp.enable('pyright')

-- LSP Diagnostic configuration
vim.diagnostic.config({
    signs = true,
    virtual_text = { prefix = '●' },
    update_in_insert = false,
    float = { border = 'rounded' },
})

-- Telescope
require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "%.pyc$",
      "__pycache__/",
      "%.pyo$",
    },
  },
})
require('telescope').load_extension('fzf')

-- Auto-save
require('auto-save').setup()

-- DAP
local dap = require('dap')
local dapui = require('dapui')

dapui.setup()
require('nvim-dap-virtual-text').setup()

-- Auto open/close DAP UI on debug sessions
dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
dap.listeners.before.event_exited['dapui_config']     = function() dapui.close() end

-- Python adapter (debugpy)
require('dap-python').setup('python3')

-- DAP Keybindings
vim.keymap.set('n', '<F5>',  dap.continue,          { desc = 'Start / Continue' })
vim.keymap.set('n', '<F9>',  dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<F10>', dap.step_over,          { desc = 'Step over' })
vim.keymap.set('n', '<F11>', dap.step_into,          { desc = 'Step into' })
vim.keymap.set('n', '<F12>', dap.step_out,           { desc = 'Step out' })
vim.keymap.set('n', '<S-F9>', function()
    dap.set_breakpoint(vim.fn.input('Condition: '))
end, { desc = 'Conditional breakpoint' })
vim.keymap.set('n', '<S-F5>', dap.terminate,         { desc = 'Terminate' })
vim.keymap.set('n', ',du',   dapui.toggle,           { desc = 'Toggle DAP UI' })
vim.keymap.set('n', ',dr',   dap.repl.open,          { desc = 'Open REPL' })

-- Breakpoint signs (Pustota theme)
vim.fn.sign_define('DapBreakpoint',          { text = '●', texthl = 'DiagnosticError' })
vim.fn.sign_define('DapBreakpointCondition', { text = '◆', texthl = 'DiagnosticWarn' })
vim.fn.sign_define('DapStopped',             { text = '▶', texthl = 'DiagnosticInfo', linehl = 'CursorLine' })

-- Autocomplete settings - упрощенные
local cmp = require('cmp')
cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
   
  performance = {
    max_view_entries = 10, 
  },
  
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(), -- Вызов меню автокомплита
    ['<C-e>'] = cmp.mapping.abort(), -- Закрыть меню
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Подтвердить выбор
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Принять предложение по Tab
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Навигация вверх
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Навигация вниз    
  },
  
  sources = {
    { name = 'nvim_lsp', max_item_count = 10 },  -- Только LSP предложения
  }, 
})
