-- +-------------------------------+
-- | Neovim - Git config           |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240917             |
-- +-------------------------------+

local nmap = require("core.helpers").nmap

local function git_config()
  local ok, git = pcall(require, 'gitsigns')
  if not ok then
    print("Gitsign not found")
    return
  end
  git.setup()


  nmap("<leader>gb", git.blame_line, "[b]lame")
end

local specs = {
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = git_config
  },
}

return specs
