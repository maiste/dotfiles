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
          c = { name = "Command"},
          d = { name = "Diagnostics" },
          f = { name = "Find" },
          g = { name = "Git" },
          l = { name = "Lsp" },
          t = { name = "Tree"},
          w = { name = "Writing" }
        }
      })
    end,
  }
}
