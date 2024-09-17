return {
  {
    'jghauser/follow-md-links.nvim'
  },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    ft = "markdown",
    config = function()
      require("peek").setup({
        auto_load = true,
        app = { "epiphany", "--private-instance" },
      })
    end,
    keys = {
      {
        "<leader>wp",
        function()
          require("peek").open()
        end,
        desc = "[w]riting [p]review"
      },
      {
        "<leader>wc",
        function()
          require("peek").open()
        end,
        desc = "[w]riting [c]lose"
      }
    },
  },
}
