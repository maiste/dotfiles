-- +-------------------------------+
-- | Neovim - Theme File           |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20250323             |
-- +-------------------------------+

local scheme = "nord"
-- local scheme = "catppuccin"
local theme = "dark"
-- local theme = "light"

local function set_theme()
  vim.opt.bg = theme
  vim.cmd.colorscheme(scheme)
end

local function catppuccin_config()
  -- If light, we want to move to catppuccin latte
  if theme == "light" then
    scheme = "catppuccin"
  end
  if scheme == "catppuccin" then
    set_theme()
  end
end

local function nord_config()
  -- No support for dark theme in nord
  if scheme == "nord" and theme == "dark" then
    local ok, nord = pcall(require, "nord")
    if not ok then
      print("nord cannot be found")
      return
    end
    nord.setup({
      -- Override the default colors
      ---@param colors Nord.Palette
      on_colors = function(colors)
        colors.polar_night.origin = "#1e1e2e"
        -- Use catppuccin background instead of Nord default because it is darker
      end
    })
    set_theme()
  end
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = catppuccin_config,
  },
  {
    'gbprod/nord.nvim',
    lazy = false,
    priority = 1000,
    config = nord_config,
  },
}
