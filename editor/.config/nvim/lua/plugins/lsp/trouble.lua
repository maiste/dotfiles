-- +-------------------------------+
-- | Neovim - Trouble config       |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240917             |
-- +-------------------------------+

local nmap = require("core.helpers").nmap

local function trouble_config()
  local ok, trouble = pcall(require, "trouble")
  if not ok then
    print("Trouble not found")
    return
  end

  local diagnostics = {
    mode = "diagnostics",
    focus = true
  }

  local local_diagnostics = {
    mode = "diagnostics",
    filter = { buf = 0 },
    focus = true
  }

  nmap("<leader>dd", function() trouble.toggle(local_diagnostics) end, "[d]ocument")
  nmap("<leader>dt", function() trouble.toggle(diagnostics) end, "[t]oggle")
end

local specs = {
  "folke/trouble.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = trouble_config
}

return specs
