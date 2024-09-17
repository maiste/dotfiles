-- +-------------------------------+
-- | Neovim - Treesitter config    |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240917             |
-- +-------------------------------+


local function treesitter_config()
  local ok, treesitter = pcall(require, "nvim-treesitter.configs")
  if not ok then
    print("Treesitter not found")
    return
  end
  treesitter.setup({
    -- Syntax highlighting
    highlight = {
      enable = true,
      use_languagetree = true
    },
    -- Smart indent
    indent = {
      enable = true,
      disable = {},
    },
    -- Use the dependency
    autotag = {
      enable = true
    },
    -- Select using Treesitter parser
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<BS>"
      }
    },
    -- Auto install and update parsers
    auto_install = true,
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
      "haskell",

      "java",
      "dart",
      "kotlin",

      "go",
      "rust",
      "c",

      "markdown",
    }

  })
end

local specs = {
  "windwp/nvim-ts-autotag",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag"
    },
    config = treesitter_config
  }
}

return specs
