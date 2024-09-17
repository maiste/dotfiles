-- +-------------------------------+
-- | Neovim - Autopair             |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240917             |
-- +-------------------------------+

local function autopairs_config()
  local ok, autopairs = pcall(require, 'nvim-autopairs')
  if not ok then
    print("Autopairs not found")
    return
  end
  autopairs.setup({
    check_ts = true,
    -- Allow to define Treesitter specific config
    ts_config = {},
    -- Disable in specific situations
    disable_filetype = {
      "TelescopePrompt",
      "vim"
    },
  })
end

local specs = {
  'windwp/nvim-autopairs',
  dependencies = {
    "hrsh7th/nvim-cmp"
  },
  config = autopairs_config
}

return specs
