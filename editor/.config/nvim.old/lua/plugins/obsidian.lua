return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/Wiki/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/Wiki/**.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = vim.fn.expand "~" .. "/Wiki/Notes",
      },
      {
        name = "monica",
        path = vim.fn.expand "~" .. "/Wiki/.monica",
      },
    },
  },
}
