-- +-------------------------------+
-- | Neovim - Which Key            |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240915             |
-- +-------------------------------+

local which_key_config = function(_, opts)
  local ok, wk = pcall(require, "which-key")
  if not ok then
    print("Which key not found")
  end

  wk.setup(opts)
  wk.add({
    { "<leader>c",  group = "[c]ode" },
    { "<leader>cc", group = "[c]omment" },
    { "<leader>d",  group = "[d]iagnostics" },
    { "<leader>e",  group = "[e]xplorer" },
    { "<leader>g",  group = "[g]it" },
    { "<leader>l",  group = "[l]sp" },
    { "<leader>ld", group = "[d]iagnostics" },
    { "<leader>lg", group = "[g]oto" },
    { "<leader>lw", group = "[w]orkspace" },
    { "<leader>o",  group = "[o]ther" },
    { "<leader>s",  group = "[s]plit" },
    { "<leader>t",  group = "[t]elescope" },
    { "<leader>u",  group = "[u]ndotree" },
    { "<leader>w",  group = "[w]riting" },
  })
end

local specs = {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = which_key_config
  }
}

return specs
