-- +---------------------------+
-- | Telescope                 |
-- +---------------------------+
-- | Author: Étienne Marais    |
-- | Version: 20220103         |
-- +---------------------------+

-- Import utils module
local utils = require('utils')

-- Telescope mappings

utils.map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
utils.map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
utils.map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
utils.map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>")
