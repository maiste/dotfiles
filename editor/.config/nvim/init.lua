
-- Needs to be set first
vim.g.mapleader = " "

-- Initialize lazy and associated plugins
require('core.lazy')

-- Load personnal core setup
require('core.opts')

-- Load generic keymaps
require('core.keys')

-- Load globals
require('core.globals')
