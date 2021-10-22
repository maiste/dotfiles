-- +---------------------------+
-- | Neovim lua config         |
-- +---------------------------+
-- | Author: Étienne Marais    |
-- | Version: 20220103         |
-- +---------------------------+

-- General aliases
local fn = vim.fn
local execute = vim.api.nvim_command

-- Load important settings
require('settings')

-- Load keybindings
require('keys')

-- Load packer
require('plugins.packer')

-- Load plugins specs
require('plugins')

-- Load plugin configs
require('plugins.telescope')
require('plugins.lsp')
require('plugins.completion')
require('plugins.snippets')
require('plugins.autopair')
require('plugins.line')
