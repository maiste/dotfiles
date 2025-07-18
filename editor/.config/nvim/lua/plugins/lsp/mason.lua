-- +-------------------------------+
-- | Neovim - Mason Pkg Manager    |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240920             |
-- +-------------------------------+

local function masonlsp_config()
  local ok_masonlsp, masonlsp = pcall(require, "mason-lspconfig")
  if not ok_masonlsp then
    print("Mason-lspconfig not found in mason")
    return
  end

  -- List of LSP to install
  masonlsp.setup({
    ensure_installed = {
      "lua_ls",
      "basedpyright",
      "rust_analyzer",
      "gopls",

      "dockerls",
      "helm_ls",

      "yamlls",
      "jsonls",

      "cssls",
      "ts_ls",
      "tailwindcss",
      "svelte",
      "denols",

      "marksman",
    },
    automatic_enable = true,
  })
end

local function mason_config()
  local ok_mason, mason = pcall(require, "mason")
  if not ok_mason then
    print("Mason not found")
    return
  end

  -- Source: https://github.com/josean-dev/dev-environment-files/blob/cb670e8890ca9d8baf978b38ed75987b742032e6/.config/nvim/lua/josean/plugins/lsp/mason.lua#L17
  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  masonlsp_config()
end

local specs = {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = mason_config,
  },
}

return specs
