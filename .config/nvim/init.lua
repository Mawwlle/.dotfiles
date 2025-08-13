vim.opt.mouse = "a" -- Enable mouse support
vim.opt.encoding = "utf-8"       -- Общая кодировка (необязательно, по умолчанию UTF-8)
vim.opt.fileencoding = "utf-8"  -- Кодировка файлов
vim.opt.number = true -- Show line numbers
vim.opt.swapfile = false -- Disable .swp files 
vim.opt.tabstop = 4 -- Spaces instead of one tab
vim.opt.softtabstop = 4 -- Spaces instead of one tab
vim.opt.shiftwidth = 4 -- Spaces for auto indent
vim.opt.expandtab = true -- Replace tab with spaces
vim.opt.autoindent = true -- Save indent on new line
vim.opt.fileformat = "unix"
vim.opt.smartindent = true
vim.opt.splitbelow = true -- horizontal split open below and right
vim.opt.splitright = true
vim.g.mapleader = ',' -- Leader key

-- Keymaps for programming languages
vim.api.nvim_create_autocmd('FileType', {

    pattern = 'python',
    callback = function()

        vim.opt.colorcolumn = '88'
        vim.keymap.set('n', '<C-h>', ':w<CR>:!python3 %<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!python3 %<CR>', { buffer = true, silent = true })
    end
})


-- Common keymaps
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('n', ',<Space>', ':nohlsearch<CR>', { noremap = true })
vim.keymap.set('n', 'H', 'gT', { noremap = true }) -- Переключение вкладок
vim.keymap.set('n', 'L', 'gt', { noremap = true })
vim.keymap.set('n', ',f', ':Telescope find_files<CR>', { noremap = true })
vim.keymap.set('n', ',g', ':Telescope live_grep<CR>', { noremap = true })
vim.keymap.set('n', 'gw', ':bp|bd #<CR>', { noremap = true, silent = true })

-- Plugins with packer.nvim
require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    use {
      'L3MON4D3/LuaSnip',
      config = function()
        local ls = require("luasnip")
        local snip_path = vim.fn.stdpath("config") .. "/snippets"
        require("luasnip.loaders.from_lua").lazy_load({ paths = snip_path })

        -- ваши маппинги для expand/jump
        vim.keymap.set({"i", "s"}, "<Tab>", function()
          if ls.expand_or_jumpable() then
            ls.expand_or_jump()
          end
        end, { silent = true })

        vim.keymap.set({"i", "s"}, "<S-Tab>", function()
          if ls.jumpable(-1) then
            ls.jump(-1)
          end
        end, { silent = true })

      end
    }

    use 'nvim-lua/plenary.nvim' -- For Telescope plugin
    use 'neovim/nvim-lspconfig' -- LSP
    use 'hrsh7th/nvim-cmp' -- Autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'nvim-treesitter/nvim-treesitter' -- Подсветка синтаксиса

    use 'morhetz/gruvbox' -- Color schemes
    use 'sainnhe/gruvbox-material'
    use 'rebelot/kanagawa.nvim'

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
    use 'jose-elias-alvarez/null-ls.nvim' -- Форматирование и линтинг
end)

-- Color scheme
--vim.cmd([[colorscheme "rose-pine-main"]])
vim.cmd([[colorscheme gruvbox]]) -- kanagawa-wave, kanagawa-dragon, kanagawa-lotus

-- LSP
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)

    -- Быстрые команды для LSP
    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)

    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
end

-- Настройка LSP для Python (Pyright)
lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
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

-- Elixir
require("elixir").setup({
  nextls = {enable = false},
  elixirls = {enable = true},
  projectionist = {enable = true},
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

-- Autocomplete settings with limited entries
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
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Навигация вверх
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Навигация вниз    
  },
  
  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 10 },  -- Limit LSP suggestions
    { name = 'luasnip', max_item_count = 5 },    -- Limit snippet suggestions
  }), 
})
