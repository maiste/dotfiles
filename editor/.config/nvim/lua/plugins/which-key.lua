-- Generic plugins
return {
  {
    "folke/which-key.nvim",
    config = function(_, opts)
      -- TODO: Move to option
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      local wk = require("which-key")
      wk.setup(opts)
      wk.register({
        ["<leader>"] = {
          f = { name = "Find" },
          l = { name = "Lsp" },
          g = { name = "Git" },
          d = { name = "Diagnostics" },
          s = { name = "Search" },
          t = { name = "Tree"},
          c = { name = "Command"}
        }
      })
    end,
  }
}
