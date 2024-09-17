-- +-------------------------------+
-- | Neovim - Manage Undo Actions  |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240916             |
-- +-------------------------------+

local nmap = require("core.helpers").nmap

local function undotree_config()
  nmap("<leader>us", ":UndotreeShow<CR>", "[u]ndotree [s]how")
  nmap("<leader>uf", ":UndotreeFocus<CR>", "[u]ndotree [f]ocus")
end

local specs = {
  {
    "mbbill/undotree",
    config = undotree_config
  }
}

return specs
