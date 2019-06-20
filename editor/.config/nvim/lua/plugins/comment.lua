local specs = {
  "numToStr/Comment.nvim",
  config = function()
    require('Comment').setup({
      mappings = {
        basic = false,
        extra = false,
      }
    })

    local esc = vim.api.nvim_replace_termcodes(
      '<ESC>', true, false, true
    )

    local vmap = require('core.helpers').vmap
    local nmap = require('core.helpers').nmap

    nmap("<leader>ci",
      require('Comment.api').toggle.linewise.current,
      "[c]omment [i]nvert")

    vmap("<leader>ci",
      function()
        vim.api.nvim_feedkeys(esc, 'nx', false)
        require('Comment.api').toggle.linewise(vim.fn.visualmode())
      end,
      "[c]omment [i]nvert")
  end,
}

return specs
