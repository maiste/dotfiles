return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  ft = "markdown",
  config = function()
    require("peek").setup({
      auto_load = false,
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
    }
  }
}
