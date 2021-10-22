-- +---------------------------+
-- | Packer configuration      |
-- +---------------------------+
-- | Author: Étienne Marais    |
-- | Version: 20220103         |
-- +---------------------------+

-- General aliases
local fn = vim.fn
local execute = vim.api.nvim_command

-- Load packer if not in path
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]

-- Auto reload lua plugins
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
