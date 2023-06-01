return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ahmedkhalf/project.nvim',
    'stevearc/aerial.nvim'
  },
  keys = {
    {
      "<leader>tf",
      function()
        require('telescope.builtin').find_files({
          hidden = true
        })
      end,
      desc = "[f]iles"
    },
    {
      "<leader>to",
      function()
        local ivy = require('telescope.themes').get_ivy()
        require('telescope.builtin').oldfiles(ivy)
      end,
      desc = "[o]ld (Files)"
    },
    {
      "<leader>tr",
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = "[r]ipgrep"
    },
    {
      "<leader>tb",
      function()
        require('telescope.builtin').buffers()
      end,
      desc = "Buffers"
    },
    {
      "<leader>th",
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = "[h]help",
    },
    {
      "<leader>tk",
      function()
        require('telescope.builtin').keymaps()
      end,
      desc = "[k]eymaps (normal)"
    },
    {
      "<leader>tt",
      function()
        local ivy = require('telescope.themes').get_ivy()
        require('telescope.builtin').filetypes(ivy)
      end,
      desc = "[f]iletypes"
    },
    {
      "<leader>ta",
      function()
        require("telescope").extensions.aerial.aerial()
      end,
      desc = "[a]erial"
    },
    {
      "<leader>td",
      function()
        local ivy = require('telescope.themes').get_ivy()
        require('telescope.builtin').diagnostics(ivy)
      end,
      desc = "[d]iagnostic"
    }
  },
  config = function()
    require("project_nvim").setup({
      patterns = {
        ".git",
        "_opam",
        "_darcs",
        ".hg",
        ".bzr",
        ".svn",
        "Makefile",
        "package.json"
      },
      show_hidden = true,
    })

    require('aerial').setup()

    local telescope = require('telescope')
    telescope.load_extension('projects')
    telescope.load_extension('aerial')
  end
}
