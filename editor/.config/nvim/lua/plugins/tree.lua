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
      "<leader>to",
      "<cmd>Neotree<CR>",
      desc = "[t]ree [o]pen",
    },
    {
      "<leader>tc",
      "<cmd>Neotree close<CR>",
      desc = "[t]ree [c]lose",
    },
  },
}
