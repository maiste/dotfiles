-- +-------------------------------+
-- | Neovim - Treesitter config    |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240920             |
-- +-------------------------------+

local function mlx_config()
  local ok, _ocaml_mlx = pcall(require, "ocaml_mlx")
  if not ok then
    print("OCaml-mlx not found")
    return
  end
end

local function treesitter_config()
  mlx_config()

  local ok, treesitter = pcall(require, "nvim-treesitter.configs")
  if not ok then
    print("Treesitter not found")
    return
  end
  treesitter.setup({
    -- Syntax highlighting
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    -- Smart indent
    indent = {
      enable = true,
      disable = {},
    },
    -- Use the dependency
    autotag = {
      enable = true,
    },
    -- Select using Treesitter parser
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<BS>",
      },
    },
    -- Auto install and update parsers
    auto_install = true,
    sync_install = false,
    ignore_install = {},
    ensure_installed = {
      "yaml",
      "json",
      "dockerfile",
      "vim",

      "html",
      "css",
      "javascript",
      "typescript",

      "bash",
      "python",
      "lua",

      "ocaml",
      "ocaml_mlx",
      "haskell",

      "java",
      "dart",
      "kotlin",

      "go",
      "rust",
      "c",

      "markdown",
    },
  })
end

local specs = {
  "windwp/nvim-ts-autotag",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "ocaml-mlx/ocaml_mlx.nvim",
    },
    config = treesitter_config,
  },
}

return specs
