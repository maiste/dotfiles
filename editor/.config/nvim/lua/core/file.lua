-- +-------------------------------+
-- | neovim - filetype config      |
-- +-------------------------------+
-- | author: maiste <dev@maiste.fr |
-- | license: mit                  |
-- | version: 20241024             |
-- +-------------------------------+

-- Add filetype aliases
vim.filetype.add({
  pattern = {
    ['.*.eliom'] = 'ocaml',
  },
})
