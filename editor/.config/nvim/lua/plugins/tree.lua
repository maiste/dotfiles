return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>eo",
      "<cmd>Neotree<CR>",
      desc = "[o]pen",
    },
    {
      "<leader>ec",
      "<cmd>Neotree close<CR>",
      desc = "[c]lose",
    },
    {
      "<leader>et",
      "<cmd>NeoTreeShowToggle<CR>",
      desc = "[t]oggle"
    }
  },
}
