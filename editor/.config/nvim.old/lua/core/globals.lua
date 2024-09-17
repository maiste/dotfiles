--[[
    Debug function(s).
    Extracted from: https://www.youtube.com/watch?v=n4Lp4cV8YR0
--]]

-- Inspect the value without altering the return.
P = function(v)
  print(vim.inspect(v))
  return v
end
