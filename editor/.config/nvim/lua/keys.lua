-- +---------------------------+
-- | Keybindings               |
-- +---------------------------+
-- | Author: Étienne Marais    |
-- | Version: 20220103         |
-- +---------------------------+

-- Import utils module
local utils = require('utils')

-- Define map leader
vim.g.mapleader = ' '

-- Clear highlighting
utils.map('n', '<leader>ss', '<cmd>noh<CR>')

-- Escape from insert mode
utils.map('i', 'jk', '<Esc>')
utils.map('i', 'kj', '<Esc>')

-- Windows navigation
utils.map('n', '<C-h>', '<C-w>h')
utils.map('n', '<C-j>', '<C-w>j')
utils.map('n', '<C-k>', '<C-w>k')
utils.map('n', '<C-l>', '<C-w>l')

-- Windows resizing
utils.map('n', '<M-h>', ':vertical resize -2<CR>')
utils.map('n', '<M-l>', ':vertical resize +2<CR>')
utils.map('n', '<M-j>', ':resize -2<CR>')
utils.map('n', '<M-k>', ':resize +2<CR>')

-- Move between buffers
utils.map('n', '<TAB>', ':bnext<CR>')
utils.map('n', '<S-TAB>', ':bprevious<CR>')
utils.map('n', '<leader>bd', ':bdelete<CR>')

-- Escape terminal
utils.map('t', '<Esc>', '<C-\\><C-n>')

-- Reselect visual after indent
utils.map('v', '<', '<gv')
utils.map('v', '>', '>gv')
