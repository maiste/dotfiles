local specs = {
  "numToStr/Comment.nvim",
  dependencies = {
    "folke/which-key.nvim",
  },
  config = function()
    local ok_whichkey, whichkey = pcall(require, "which-key")
    if not ok_whichkey then
      print("Which-key not found")
      return
    end

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

    whichkey.add({
      { "<leader>cc", group = "[c]omment" }
    })

    nmap("<leader>cci",
      require('Comment.api').toggle.linewise.current,
      "[c]omment [i]nvert")

    vmap("<leader>cci",
      function()
        vim.api.nvim_feedkeys(esc, 'nx', false)
        require('Comment.api').toggle.linewise(vim.fn.visualmode())
      end,
      "[c]omment [i]nvert")
  end,
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
      local ok_telescope, telescope = pcall(require, "telescope")
      if not ok_telescope then
        print("Telescope not found!")
        return
      end
      telescope.load_extension("todo-comments")
    end,
    keys = {
      {
        "<leader>tcf",
        function()
          require("telescope").extensions['todo-comments'].todo()
        end,
        desc = "[f]ixme"
      }
    }
  }
}

return specs
