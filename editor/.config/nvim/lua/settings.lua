-- +---------------------------+
-- | Settings written in lua   |
-- +---------------------------+
-- | Author: Étienne Marais    |
-- | Version: 20220103         |
-- +---------------------------+

-- Import utils
local utils = require('utils')

-- Alias for cmd
local cmd = vim.cmd

-- Set size for tab
local indent = 4

-- Set size for cmdmine
local height = 2

-- Set size for scroll
local scroll = 8

-- Basic settings for Neovim
cmd 'syntax enable'
cmd 'filetype plugin indent on'


-- Set tab options
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'cursorline', true)
utils.opt('o', 'showcmd', true)
utils.opt('o', 'cmdheight', height)
utils.opt('o', 'mouse', 'a')
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('o', 'number', true)
utils.opt('o', 'clipboard', 'unnamed,unnamedplus')
utils.opt('o', 'laststatus', 2)
utils.opt('o', 'showtabline', 2)

-- Scroll off
utils.opt('o', 'scrolloff', scroll)
utils.opt('o', 'sidescrolloff', scroll)


-- Hidden chars
utils.opt('o', 'list', true)
vim.opt.listchars:append("trail:·")
vim.opt.listchars:append("lead:·")


-- Set colorscheme
utils.opt('o', 'termguicolors', true)
cmd 'colorscheme nord'

