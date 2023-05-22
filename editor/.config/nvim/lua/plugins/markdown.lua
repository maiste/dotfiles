return {
  "iamcco/markdown-preview.nvim",
  build =
    function()
      vim.fn["mkdp#util#install"]()
    end,
  keys = {
    {
      "<leader>wp",
      function()
        vim.cmd("MarkdownPreview<CR>")
      end,
      desc = "[w]riting [p]review"
    }
  }
}
