-- +-------------------------------+
-- | Neovim - Package Manager File |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240915             |
-- +-------------------------------+


-- Install Lazy if not presents
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy");
if not ok then
  print("Lazy not found")
  return
end

lazy.setup({
  { import = 'plugins' },
  { import = 'plugins.lsp' }
}, {
  change_detection = {
    notify = false -- Ensure we don't get the annoying notification message
  }
})
