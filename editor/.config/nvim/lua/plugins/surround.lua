-- +-------------------------------+
-- | Neovim - Surround config      |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240917             |
-- +-------------------------------+

local function surround_config()
  local ok, surround = pcall(require, "nvim-surround")
  if not ok then
    print("Surround not found")
    return
  end
  surround.setup({
    config = true
  })
end

local specs = {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = surround_config
}

return specs
