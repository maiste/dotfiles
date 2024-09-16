return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    config = function()
      -- require("catppuccin").setup({
      -- });
      vim.cmd.colorscheme("catppuccin-mocha")
    end
  }
}
