-- +-------------------------------+
-- | Neovim - Generic keybindings  |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240915             |
-- +-------------------------------+

local helpers = require("core.helpers")
local nmap = helpers.nmap
local imap = helpers.imap
local vmap = helpers.vmap
local tmap = helpers.tmap

-- Search
nmap("<leader>os", "<cmd>nohl<CR>", "[s]top search")

-- Manage split windows
nmap("<leader>sv", "<C-w>v", "[s]plit [v]]ertically")
nmap("<leader>sh", "<C-w>s", "[s]plit [h]orizontally")
nmap("<leader>se", "<C-w>=", "[s]plit [e]qual")
nmap("<leader>sx", "<cmd>close<CR>", "[s]plit e[x]it")

-- Movement between windows
nmap("<C-h>", "<C-w>h", "Go to left window")
nmap("<C-j>", "<C-w>j", "Go to down window")
nmap("<C-k>", "<C-w>k", "Go to up window")
nmap("<C-l>", "<C-w>l", "Go to right window")

-- Move windows
nmap("<C-Left>", "<C-w><S-h>", "Move window to the left")
nmap("<C-Down>", "<C-w><S-j>", "Move window to down")
nmap("<C-Up>", "<C-w><S-k>", "Move window to up")
nmap("<C-Right>", "<C-w><S-l>", "Move window to the right")

-- Change split sizes
nmap("<S-k>", ":resize +2<CR>", "Resize up")
nmap("<S-j>", ":resize -2<CR>", "Resize down")
nmap("<S-h>", ":vertical resize +2<CR>", "Resize left")
nmap("<S-l>", ":vertical resize -2<CR>", "Resize right")

-- Cycle between buffers
nmap("<TAB>", ":bnext<CR>", "Next buffer")
nmap("<S-TAB>", ":bprevious<CR>", "Previous buffer")

-- Escape alternatives
imap("jk", "<Esc>", "Escape")
imap("kj", "<Esc>", "Escape")

-- Retab with selection kept
vmap("<", "<gv", "Retab left and keep selected")
vmap(">", ">gv", "Retab right and keep selected")

-- Use escape normally as in VIM in the terminal mode
tmap("<Esc>", "<C-\\><C-n>", "Escape terminal")
