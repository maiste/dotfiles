-- +-------------------------------+
-- | Neovim - General Options File |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240915             |
-- +-------------------------------+

-- Default indentation options
local indent = 2
vim.opt.expandtab = true    -- Turn tab into space
vim.opt.shiftwidth = indent -- Size of a Tab keypresss
vim.opt.tabstop = indent    -- Size o a tab
vim.opt.autoindent = true   -- Copy indentation from the previous line
vim.opt.smartindent = true  -- Keep track of location

-- Default status line
local height = 2
vim.opt.cmdheight = height -- Height of the status line
vim.opt.laststatus = 2     -- Always display the status line
vim.opt.showcmd = true     -- Show partuial cmds executed

-- Scroll size
local scroll = 8
vim.opt.scrolloff = scroll
vim.opt.sidescrolloff = scroll

-- Handle hidden characters
vim.opt.list = true
vim.opt.listchars:append("trail:·")

-- UX / UI
vim.opt.termguicolors = true
vim.opt.mouse = "a"       -- Always allows mouse
vim.o.number = true     -- Always show line number
vim.opt.splitbelow = true -- On sp, split below
vim.opt.splitright = true -- On vsp, split right
vim.opt.cursorline = true -- Highlight the line where your cursor is


-- Theme
local scheme = "catppuccin"
vim.opt.bg = "dark"
vim.cmd.colorscheme(scheme)

-- Search
vim.opt.ignorecase = true -- Case insentive when searching
vim.opt.smartcase = true  -- If mixed cases, try to use case

-- Clipboard
vim.opt.clipboard = 'unnamed,unnamedplus'

-- Timeout definition
vim.opt.timeout = true
vim.opt.timeoutlen = 500

-- Configure wrapping
vim.opt.wrap = false      -- Do not wrap line

-- Backup & swaps
vim.opt.swapfile = false  -- Don't use swap file (I don't like them)
vim.opt.backup = false    -- Do not keep backup file either

-- Search
vim.opt.hlsearch = false  -- Don't keep the old search highligh
vim.opt.incsearch = true  -- Display the search as it is written
