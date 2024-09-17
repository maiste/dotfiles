return {
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require('gitsigns').setup()
    end,
    keys = {
      {
        "<leader>gb",
        function()
          require('gitsigns').blame_line()
        end,
        desc = "[b]lame"
      }
    }
  },
  {
    'dinhhuy258/git.nvim',
    config = function()
      require('git').setup({
        default_mappings = false
      })
    end
  }
}
