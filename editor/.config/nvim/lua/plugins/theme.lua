-- +-------------------------------+
-- | Neovim - Theme File           |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240917             |
-- +-------------------------------+

local function theme_config()
	local scheme = "catppuccin"
	vim.opt.bg = "dark"
	vim.cmd.colorscheme(scheme)
end

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = theme_config,
	},
}
