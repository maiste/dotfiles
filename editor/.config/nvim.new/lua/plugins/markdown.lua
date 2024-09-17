-- +-------------------------------+
-- | Neovim - Markdown config      |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240917             |
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
  nmap("<leader>wc", peek.close(), "[w]riting [c]lose")
end

local specs = {
  {
    'jghauser/follow-md-links.nvim'
  },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    ft = "markdown",
    config = peek_config
  },
}

return specs
