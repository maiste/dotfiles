-- +-------------------------------+
-- | Neovim - Comment config       |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240917             |
-- +-------------------------------+

local vmap = require('core.helpers').vmap
local nmap = require('core.helpers').nmap

local function comment_config()
  local ok, comment = pcall(require, "Comment")
  if not ok then
    print("Comment not found")
    return
  end

  comment.setup({
    mappings = {
      basic = false,
      extra = false,
    }
  })

  local esc = vim.api.nvim_replace_termcodes(
    '<ESC>', true, false, true
  )

  nmap("<leader>cci",
    require('Comment.api').toggle.linewise.current,
    "[i]nvert")

  vmap("<leader>cci",
    function()
      vim.api.nvim_feedkeys(esc, 'nx', false)
      require('Comment.api').toggle.linewise(vim.fn.visualmode())
    end,
    "[i]nvert")
end

local specs = {
  {
    "numToStr/Comment.nvim",
    config = comment_config
  },
}

return specs
