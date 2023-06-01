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
          c = { name = "[c]ode" },
          d = { name = "[d]iagnostics" },
          e = { name = "[e]xplorer" },
          g = { name = "[g]it" },
          l = { name = "[l]sp" },
          o = { name = "[o]ther" },
          t = { name = "[t]elescope" },
          w = { name = "[w]riting" }
        }
      })
    end,
  }
}
