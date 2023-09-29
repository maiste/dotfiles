-- Default indent size
local indent = 4
vim.o.expandtab = true
vim.o.shiftwidth = indent
vim.o.tabstop = indent
vim.o.smartindent = true

-- Status line
local height = 2
vim.o.cmdheight = height
vim.o.showcmd = true
vim.o.laststatus = 2 -- Always

-- Scroll size
local scroll = 8
vim.o.scrolloff = scroll
vim.o.sidescrolloff = scroll

-- Hidden chars
vim.o.list = true
vim.opt.listchars:append("trail:·")

-- UI
vim.o.termguicolors = true
vim.o.bg = "dark"
vim.o.mouse = 'a' -- Always be able to use mouse
vim.o.number = true
vim.o.splitbelow = true
vim.o.splitright = true

-- Clipboard
vim.o.clipboard = 'unnamed,unnamedplus'

-- Completion
vim.o.wildmode = 'list:longest'

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
