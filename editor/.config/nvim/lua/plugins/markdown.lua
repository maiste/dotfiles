-- +-------------------------------+
-- | Neovim - Markdown config      |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240918             |
-- +-------------------------------+

local nmap = require("core.helpers").nmap

local function peek_config()
	local ok, peek = pcall(require, "peek")
	if not ok then
		print("Peek not found")
		return
	end
	peek.setup({
		auto_load = true,
		app = { "epiphany", "--private-instance" },
	})
	nmap("<leader>wp", peek.open, "[w]riting [p]review")
	nmap("<leader>wc", peek.close, "[w]riting [c]lose")
end

local function obsidian_config()
	local ok, obsidian = pcall(require, "obsidian")
	if not ok then
		print("Obsidian not found")
		return
	end
	obsidian.setup({
		workspaces = {
			{
				name = "notes",
				path = vim.fn.expand("~") .. "/Wiki/Notes",
			},
			{
				name = "monica",
				path = vim.fn.expand("~") .. "/Wiki/.monica",
			},
		},
	})
end

local specs = {
	{
		"jghauser/follow-md-links.nvim",
	},
	{
		"toppair/peek.nvim",
		build = "deno task --quiet build:fast",
		ft = "markdown",
		config = peek_config,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		config = obsidian_config,
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/Wiki/**.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/Wiki/**.md",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}

return specs
