return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/neodev.nvim",
    "hrsh7th/cmp-nvim-lsp",
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require('mason-lspconfig').setup({
          ensure_installed = {
            "dockerls",
            "pylsp",
            "lua_ls",
            "yamlls",

            "cssls",
            "tsserver",
            "tailwindcss",

            "jdtls",

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
      lmap('<leader>lgd', vim.lsp.buf.definition, "[g]oto [d]efinition")
      lmap('<leader>lgD', vim.lsp.buf.declaration, "[g]oto [D]eclaration")
      lmap('<leader>lgi', vim.lsp.buf.implementation, "[g]oto [i]mplementation")
      lmap('<leader>lgr', vim.lsp.buf.references, "[g]oto [r]eferences")
      lmap('<leader>lgt', vim.lsp.buf.type_definition, "[g]oto [t]ype definition")

      -- Workspace
      lmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, "[w]orkspace [a]dd")
      lmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, "[w]orkspace [r]emove")
      lmap('<leader>lwl', vim.lsp.buf.list_workspace_folders, "[w]orkspace [l]ist")

      -- Diagnostics
      lmap('<leader>do', vim.diagnostic.open_float, "[d]iagnostic [o]pen")
      lmap('<leader>dp', vim.diagnostic.goto_prev, "[d]iagnostic [p]revious")
      lmap('<leader>dn', vim.diagnostic.goto_next, "[d]iagnostic [n]ext")
      lmap('<leader>dl', vim.diagnostic.setloclist, "[d]iagnostic [l]ist")

      -- Actions
      lmap('<leader>lca', vim.lsp.buf.code_action, "[c]ode [a]ction")
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

    -- Typescript
    lsp.tsserver.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "javascript", "typescript", "typescriptreact", "typescrip.tsx" },
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
