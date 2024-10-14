-- +-------------------------------+
-- | Neovim - Formatting           |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240920             |
-- +-------------------------------+

local vmap = require("core.helpers").vmap
local nmap = require("core.helpers").nmap

-- TODO: Use OCaml with Dune Package Management
-- local function ocaml_bleeding (_bufnr)
--   if  require("conform.util").root_file({ "dune.lock" }) ~= nil then
--     return { "ocamlformat" }
--   else
--     print("Found Dune lock!")
--     return { "dune fmt"}
--   end
-- end

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
      ocaml =  { "ocamlformat" },
      -- ocaml = ocaml_bleeding,
      ocaml_mlx = { "ocamlformat_mlx" },
      go = { "gofmt" },
    },
  })

  -- Format selection
  nmap("<leader>lf", function()
    conform.format({
      lsp_fallback = true,
      timeout_ms = 1000,
    })
  end, "[f]ormat")

  vmap("<leader>lf", function()
    conform.format({
      lsp_fallback = true,
      timeout_ms = 1000,
    })
  end, "[s]election")
end

local specs = {
  "stevearc/conform.nvim",
  config = conform_config,
}

return specs
