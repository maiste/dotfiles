-- +---------------------------+
-- | Utils fn in lua           |
-- +---------------------------+
-- | Author: Étienne Marais    |
-- | Version: 20220103         |
-- +---------------------------+

-- Define return module
local utils = {}

-- Define scopes
local scopes =  { o = vim.o, b = vim.bo , w = vim.vo }

-- Set options at various scopes
function utils.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then
    scopes['o'][key] = value
  end
end

-- Set mappings
function utils.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    option = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return utils

