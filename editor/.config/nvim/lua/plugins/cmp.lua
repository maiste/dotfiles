-- +-------------------------------+
-- | neovim - completion config    |
-- +-------------------------------+
-- | author: maiste <dev@maiste.fr |
-- | license: mit                  |
-- | version: 20240917             |
-- +-------------------------------+

local function cmp_config()
  local ok_cmp, cmp = pcall(require, "cmp")
  if not ok_cmp then
    print("Cmp not found")
    return
  end

  local ok_luasnip, luasnip = pcall(require, "luasnip")
  if not ok_luasnip then
    print("Luasnip not found")
    return
  end

  local ok_luasnip_loader, luasnip_loader = pcall(require, "luasnip.loaders.from_vscode")
  if not ok_luasnip_loader then
    print("Luasnip VSCode Loader not found")
    return
  end
  luasnip_loader.lazy_load()

  local ok_lspkind, lspkind = pcall(require, "lspkind")
  if not ok_lspkind then
    print("Lspkind not found")
    return
  end

  cmp.setup({

    completion = {
      completeopt = "menu,menuone,preview,noselect"
    },

    -- Specified snippet engine
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },

    -- Setup keys
    mapping = cmp.mapping.preset.insert({
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-2),
      ['<C-f>'] = cmp.mapping.scroll_docs(2),
      ['<C-Space>'] = cmp.mapping.abort(),
      ["<C-e>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
      ["<TAB>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),

    }),

    -- Setup sources
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },   -- Import from lsp
      { name = 'buffer' },     -- Import from buffer
      { name = 'treesitter' }, -- Import treesitter
      { name = "cmp_git" },    -- Git completion
      { name = "path" },       -- Path completion
      { name = 'luasnip' },    -- Luasnip completion
    }),

    -- Formatting the presentation
    formatting = {
      format = lspkind.cmp_format({
        with_text = false,
        maxwidth = 50,
        ellipsis_char = "..."
      })
    },
  })

  -- Use buffer source for `/` and `?`
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':'
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

local specs = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/nvim-cmp",             -- Completion
    "hrsh7th/cmp-buffer",           -- Buffer source
    "hrsh7th/cmp-path",             -- Path source
    "hrsh7th/cmp-cmdline",          -- Cmdline completion
    "saadparwaiz1/cmp_luasnip",     -- Luasnip completion

    "onsails/lspkind.nvim",         -- VSCode pictogram
    "L3MON4D3/LuaSnip",             -- Lua snippets
    "rafamadriz/friendly-snippets", -- Snippets collection for Luasnip
  },
  config = cmp_config
}

return specs
