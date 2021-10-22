-- +---------------------------+
-- | Autocompletion            |
-- +---------------------------+
-- | Author: Étienne Marais    |
-- | Version: 20220103         |
-- +---------------------------+

-- Aliases
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local luasnip = require('luasnip')

-- Completion setup
cmp.setup({

    -- Setup completion
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },

    -- Setup keys
    mapping =  {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-1),
        ['<C-f>'] = cmp.mapping.scroll_docs(1),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<C-j>'] = function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end,
    },

    -- Setup sources
    sources = cmp.config.sources ({
        { name = 'nvim_lsp' }, -- Import from lsp
        { name = 'luasnip' },  -- Import from snippets
        { name = 'buffer' }    -- Import from buffer
    })
})

-- Setup for cmdline {{

-- Search in buffers
cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

-- Command in path
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
-- }}
