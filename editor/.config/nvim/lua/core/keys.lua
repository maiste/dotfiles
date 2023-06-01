local nmap = require("core.helpers").nmap
local imap = require("core.helpers").imap
local vmap = require("core.helpers").vmap
local tmap = require("core.helpers").tmap

-- Normal mode
nmap("<leader>os", "<cmd>nohl<CR>", "[s]top search")

nmap("<C-h>", "<C-w>h", "Go to left window")
nmap("<C-j>", "<C-w>j", "Go to down window")
nmap("<C-k>", "<C-w>k", "Go to up window")
nmap("<C-l>", "<C-w>l", "Go to right window")

nmap("<C-Left>", "<C-w><S-h>", "Move window to the left")
nmap("<C-Down>", "<C-w><S-j>", "Move window to down")
nmap("<C-Up>", "<C-w><S-k>", "Move window to up")
nmap("<C-Right>", "<C-w><S-l>", "Move window to the right")

nmap("<S-Up>", ":resize +2<CR>", "Resize up")
nmap("<S-Down>", ":resize -2<CR>", "Resize down")
nmap("<S-Left>", ":vertical resize +2<CR>", "Resize left")
nmap("<S-Right>", ":vertical resize -2<CR>", "Resize right")

nmap("<TAB>", ":bnext<CR>", "Next buffer")
nmap("<S-TAB>", ":bprevious<CR>", "Previous buffer")

-- Insert mode
imap("jk", "<Esc>", "Escape")
imap("kj", "<Esc>", "Escape")


-- Visual mode
vmap("<", "<gv", "Retab left and keep selected")
vmap(">", ">gv", "Retab right and keep selected")

-- Terminal mode
tmap("<Esc>", "<C-\\><C-n>", "Escape terminal")
