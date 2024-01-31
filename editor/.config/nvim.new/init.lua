-- +-------------------------------+
-- | Neovim - Startup File         |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240131             |
-- +-------------------------------+

-- Need to be set first
vim.g.mapleader = " "

-- Initialize package manager and plugins
require("core.package")

-- Setup global options
require("core.options")


