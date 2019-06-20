local M = {}

M.nmap = function(lhs, rhs, desc)
  vim.keymap.set("n", lhs, rhs, { desc = desc })
end

M.imap = function(lhs, rhs, desc)
  vim.keymap.set("i", lhs, rhs, { desc = desc })
end

M.vmap = function(lhs, rhs, desc)
  vim.keymap.set("v", lhs, rhs, { desc = desc })
end

M.tmap = function(lhs, rhs, desc)
  vim.keymap.set("t", lhs, rhs, { desc = desc })
end

return M
