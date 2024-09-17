-- +-------------------------------+
-- | Neovim - Formatting           |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240917             |
-- +-------------------------------+

local vmap = require("core.helpers").vmap

local function conform_config()
  local ok, conform = pcall(require, "conform")
  if not ok then
    print("Conform not found")
    return
  end

  conform.setup({
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      lua = { "stylua" },
      ocaml = { "ocamlformat" }
    },
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 1000,
    },
  })

  -- Format selection
  vmap("<leader>lfs", function()
    conform.format({
      lsp_fallback = true,
      timeout_ms = 1000,
    })
  end, "[s]election")
end

local specs = {
  "stevearc/conform.nvim",
  config = conform_config
}

return specs
