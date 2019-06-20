return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",             -- Lua snippets
    "rafamadriz/friendly-snippets", -- Snippets collection for Luasnip
    "hrsh7th/nvim-cmp",             -- Completion
    "onsails/lspkind.nvim",         -- VSCode pictogram
    "hrsh7th/cmp-buffer",           -- Buffer source
    "hrsh7th/cmp-path",             -- Path source
    "hrsh7th/cmp-cmdline",          -- Cmdline completion
    "saadparwaiz1/cmp_luasnip"      -- Luasnip completion
  },
  config = function()
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

    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()

    local ok_lspkind, lspkind = pcall(require, "lspkind")
    if not ok_lspkind then
      print("Lspkind not found")
      return
    end

    cmp.setup({
      -- Specified snippet engine
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },

      -- Setup keys
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-1),
        ['<C-f>'] = cmp.mapping.scroll_docs(1),
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

      -- Formatting the presentation
      formatting = {
        format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
      },

      -- Setup sources
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },   -- Import from lsp
        { name = 'buffer' },     -- Import from buffer
        { name = 'treesitter' }, -- Import treesitter
        { name = "cmp_git" },    -- Git completion
        { name = "path" },       -- Path completion
        { name = 'luasnip' },    -- Luasnip completion
      })
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
}
