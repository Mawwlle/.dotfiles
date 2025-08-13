-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/mawwlle/.cache/nvim/packer_hererocks/2.1.1753364724/share/lua/5.1/?.lua;/Users/mawwlle/.cache/nvim/packer_hererocks/2.1.1753364724/share/lua/5.1/?/init.lua;/Users/mawwlle/.cache/nvim/packer_hererocks/2.1.1753364724/lib/luarocks/rocks-5.1/?.lua;/Users/mawwlle/.cache/nvim/packer_hererocks/2.1.1753364724/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/mawwlle/.cache/nvim/packer_hererocks/2.1.1753364724/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\ropleader\1\0\2\tline\a,c\nblock\a,b\ftoggler\1\0\2\tline\b,cc\nblock\b,cb\1\0\3\fpadding\2\ropleader\0\ftoggler\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nO\0\0\2\1\2\0\t-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\3�-\0\0\0009\0\1\0B\0\1\1K\0\1\0\0�\19expand_or_jump\23expand_or_jumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2��B\0\2\2\15\0\0\0X\1\4�-\0\0\0009\0\1\0)\2��B\0\2\1K\0\1\0\0�\tjump\rjumpable�\2\1\0\b\0\21\0#6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0B\1\2\2'\2\6\0&\1\2\0016\2\0\0'\4\a\0B\2\2\0029\2\b\0025\4\t\0=\1\n\4B\2\2\0016\2\2\0009\2\v\0029\2\f\0025\4\r\0'\5\14\0003\6\15\0005\a\16\0B\2\5\0016\2\2\0009\2\v\0029\2\f\0025\4\17\0'\5\18\0003\6\19\0005\a\20\0B\2\5\0012\0\0�K\0\1\0\1\0\1\vsilent\2\0\f<S-Tab>\1\3\0\0\6i\6s\1\0\1\vsilent\2\0\n<Tab>\1\3\0\0\6i\6s\bset\vkeymap\npaths\1\0\1\npaths\0\14lazy_load\29luasnip.loaders.from_lua\14/snippets\vconfig\fstdpath\afn\bvim\fluasnip\frequire\0" },
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["auto-save.nvim"] = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/auto-save.nvim",
    url = "https://github.com/Pocco81/auto-save.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/mawwlle/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\ropleader\1\0\2\tline\a,c\nblock\a,b\ftoggler\1\0\2\tline\b,cc\nblock\b,cb\1\0\3\fpadding\2\ropleader\0\ftoggler\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nO\0\0\2\1\2\0\t-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\3�-\0\0\0009\0\1\0B\0\1\1K\0\1\0\0�\19expand_or_jump\23expand_or_jumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2��B\0\2\2\15\0\0\0X\1\4�-\0\0\0009\0\1\0)\2��B\0\2\1K\0\1\0\0�\tjump\rjumpable�\2\1\0\b\0\21\0#6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0B\1\2\2'\2\6\0&\1\2\0016\2\0\0'\4\a\0B\2\2\0029\2\b\0025\4\t\0=\1\n\4B\2\2\0016\2\2\0009\2\v\0029\2\f\0025\4\r\0'\5\14\0003\6\15\0005\a\16\0B\2\5\0016\2\2\0009\2\v\0029\2\f\0025\4\17\0'\5\18\0003\6\19\0005\a\20\0B\2\5\0012\0\0�K\0\1\0\1\0\1\vsilent\2\0\f<S-Tab>\1\3\0\0\6i\6s\1\0\1\vsilent\2\0\n<Tab>\1\3\0\0\6i\6s\bset\vkeymap\npaths\1\0\1\npaths\0\14lazy_load\29luasnip.loaders.from_lua\14/snippets\vconfig\fstdpath\afn\bvim\fluasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
