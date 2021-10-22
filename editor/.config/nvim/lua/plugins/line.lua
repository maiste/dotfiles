-- +---------------------------+
-- | Status line               |
-- +---------------------------+
-- | Author: Étienne Marais    |
-- | Version: 20220103         |
-- +---------------------------+

-- Alias
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = auto,
    always_divide_middle = true,
  },
  sections = {
      lualine_a = {'mode'},
      lualine_b = {'diff', 'diagnostics'},
      lualine_c = {'filetype', 'filename'},
      lualine_x = {'branch'},
      lualine_y = {'encoding'},
      lualine_z = {'location', 'progress'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
  }
})
