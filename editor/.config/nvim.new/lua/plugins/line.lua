-- +-------------------------------+
-- | Neovim - Line management      |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240915             |
-- +-------------------------------+

local function lualine_config()
  local ok, lualine = pcall(require, "lualine")
  if not ok then
    print("Lualine not found")
    return
  end

  lualine.setup({
    options = {
      icons_enabled = true,
      theme = "auto",
      always_divide_middle = true,
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'diff', 'diagnostics' },
      lualine_c = { 'filetype', 'filename' },
      lualine_x = { 'branch' },
      lualine_y = { 'encoding' },
      lualine_z = { 'location', 'progress' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
  })
end

local function barbecue_config()
  local ok, barbecue = pcall(require, "barbecue")
  if not ok then
    print("Barbecue not found")
    return
  end
  barbecue.setup() -- Default config is enough, I don't need "speed" here.
end

local specs = {
  {

    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = lualine_config
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = barbecue_config
  }
}

return specs
