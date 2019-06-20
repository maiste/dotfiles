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
      "<leader>ff",
      function()
        require('telescope.builtin').find_files({
          hidden = true
        })
      end,
      desc = "Files"
    },
    {
      "<leader>fo",
      function()
        local ivy = require('telescope.themes').get_ivy()
        require('telescope.builtin').oldfiles(ivy)
      end,
      desc = "Old files"
    },
    {
      "<leader>fg",
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = "Ripgrep"
    },
    {
      "<leader>fb",
      function()
        require('telescope.builtin').buffers()
      end,
      desc = "Buffers"
    },
    {
      "<leader>fh",
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = "Help",
    },
    {
      "<leader>fk",
      function()
        require('telescope.builtin').keymaps()
      end,
      desc = "Keymaps (normal)"
    },
    {
      "<leader>ft",
      function()
        local ivy = require('telescope.themes').get_ivy()
        require('telescope.builtin').filetypes(ivy)
      end,
      desc = "Filetypes"
    },
    {
      "<leader>fa",
      function()
        require("telescope").extensions.aerial.aerial()
      end,
      desc = "Aerial"
    },
    {
      "<leader>dl",
      function()
        local ivy = require('telescope.themes').get_ivy()
        require('telescope.builtin').diagnostics(ivy)
      end,
      desc = "[d]iagnostic [l]ist"
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
