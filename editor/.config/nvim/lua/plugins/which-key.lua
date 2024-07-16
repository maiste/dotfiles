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
      wk.add({
        { "<leader>c", group = "[c]ode" },
        { "<leader>d", group = "[d]iagnostics" },
        { "<leader>e", group = "[e]xplorer" },
        { "<leader>g", group = "[g]it" },
        { "<leader>l", group = "[l]sp" },
        { "<leader>o", group = "[o]ther" },
        { "<leader>t", group = "[t]elescope" },
        { "<leader>w", group = "[w]riting" },
      })
    end,
  }
}
