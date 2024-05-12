return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/which-key.nvim", -- For mappings
    "folke/neodev.nvim",
    "hrsh7th/cmp-nvim-lsp",
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require('mason-lspconfig').setup({
          ensure_installed = {
            "dockerls",
            "helm_ls",
            "yamlls",
            "jsonls",

            "lua_ls",
            "pylsp",
            "jdtls",
            "rust_analyzer",

            "cssls",
            "tsserver",
            "tailwindcss",
            "svelte",
            "denols",

            "marksman"
          }
        })
      end,
      dependencies = {
        "williamboman/mason.nvim",
        config = function()
          require('mason').setup()
        end
      },
    }
  },

  config = function()
    local ok_lsp, lsp = pcall(require, "lspconfig")
    if not ok_lsp then
      print("Lspconfig not found")
      return
    end

    local ok_neodev, neodev = pcall(require, "neodev")
    if not ok_neodev then
      print("Neodev not found")
      return
    end

    local ok_whichkey, whichkey = pcall(require, "which-key")
    if not ok_whichkey then
      print("Which-key not found")
      return
    end

    neodev.setup()

    -- Diagnostic signs
    local signs = {
      Error = " ",
      Warn = " ",
      Hint = "",
      Information = " ",
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Diagnostics config
    local config = {
      virtual_text = false,    -- Disable virtual text
      signs = true,            -- Display signs
      update_in_insert = false -- In insert mode, doesn't display errors
    }

    vim.diagnostic.config(config)


    -- Keymaps
    local on_attach = function(_, bufnr)
      local lmap = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
      end

      -- Docs
      lmap('<leader>lh', vim.lsp.buf.hover, "[h]over")
      lmap('<leader>ls', vim.lsp.buf.signature_help, "[s]ignature")

      -- Move
      whichkey.register({
        ["<leader>lg"] = {
          name = "[g]oto",
        },
      })
      lmap('<leader>lgd', vim.lsp.buf.definition, "[d]efinition")
      lmap('<leader>lgD', vim.lsp.buf.declaration, "[D]eclaration")
      lmap('<leader>lgi', vim.lsp.buf.implementation, "[i]mplementation")
      lmap('<leader>lgr', vim.lsp.buf.references, "[r]eferences")
      lmap('<leader>lgt', vim.lsp.buf.type_definition, "[t]ype definition")

      -- Workspace
      whichkey.register({
        ["<leader>lw"] = {
          name = "[w]orkspace",
        },
      })
      lmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, "[a]dd")
      lmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, "[r]emove")
      lmap('<leader>lwl', vim.lsp.buf.list_workspace_folders, "[l]ist")

      -- Diagnostics
      lmap('<leader>do', vim.diagnostic.open_float, "[o]pen")
      lmap('<leader>dp', vim.diagnostic.goto_prev, "[p]revious")
      lmap('<leader>dn', vim.diagnostic.goto_next, "[n]ext")
      lmap('<leader>dl', vim.diagnostic.setloclist, "[l]ist")

      -- Actions
      lmap('<leader>ca', vim.lsp.buf.code_action, "[a]ction")
      lmap('<leader>lr', vim.lsp.buf.rename, "[r]ename")
      lmap('<leader>lf', vim.lsp.buf.format, "[f]ormat")
    end

    -- Capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Default Mason config
    require('mason-lspconfig').setup_handlers({
      function(lsp_server)
        lsp[lsp_server].setup({
          on_attach = on_attach,
          capabilities = capabilities
        })
      end
    })

    -- Specific lsp configs

    -- OCaml
    lsp.ocamllsp.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }

    -- Rust
    lsp.rust_analyzer.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }

    -- Typescript
    lsp.tsserver.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = lsp.util.root_pattern("package.json"),
      filetypes = { "javascript", "typescript", "typescriptreact", "typescrip.tsx" },
    }

    lsp.eslint.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- Svelte
    lsp.svelte.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = lsp.util.root_pattern("package.json"),
      filetypes = { "svelte" }
    }

    -- Deno
    lsp.denols.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
    }

    -- Helm
    lsp.helm_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ['helm-ls'] = {
          yamlls = {
            path = "yaml-language-server",
          }
        }
      }
    }

    -- Yaml
    lsp.yamlls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        yaml = {
          schemas = {
            ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
          }
        }
      }
    }

    -- JSON
    lsp.jsonls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      init_options = {
        provideFormatter = false
      },
      commands = {
        Format = {
          function()
            vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
          end
        }
      }
    }

    -- Latex / Markdown
    lsp.ltex.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      checkFrequency = 'save',
      settings = {
        ltex = {
          disabledRules = {
            ['en'] = { 'PROFANITY' },
          },
        },
      },
    }
  end
}
