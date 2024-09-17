-- +-------------------------------+
-- | Neovim - Web config           |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240917             |
-- +-------------------------------+

local function colorizer_config()
	local ok, colorizer = pcall(require, "colorizer")
	if not ok then
		print("Colorizer not found")
		return
	end
	colorizer.setup()
end

local specs = {
	{
		"norcalli/nvim-colorizer.lua",
		config = colorizer_config,
	},
}

return specs
