-- +-------------------------------+
-- | Neovim - Lsp configuration    |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240131             |
-- +-------------------------------+

local function neodev_config()
  local ok_neodev, neodev = pcall(require, "neodev")
  if not ok_neodev then
    print("Neodev not found")
    return
  end

  neodev.setup()
end

local function diagnostic_config()
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
end

local function lsp_config()
  local ok_lsp, lsp = pcall(require, "lspconfig")
  if not ok_lsp then
    print("Lspconfig not found")
    return
  end

  local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
  if not ok_cmp then
    print("Cmp_nvim_lsp not found")
    return
  end

  local ok_masonlsp, masonlsp = pcall(require, "mason-lspconfig")
  if not ok_masonlsp then
    print("Mason-lspconfig not found in lsp")
    return
  end

  -- Add Neovim lua elements for configuration writting
  neodev_config()

  -- Configure error signs
  diagnostic_config()

  -- Keymaps
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      local lmap = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { silent = true, buffer = ev.buffer, desc = desc })
      end


      -- Docs
      lmap('<leader>lh', vim.lsp.buf.hover, "[h]over")
      lmap('<leader>ls', vim.lsp.buf.signature_help, "[s]ignature")

      -- Move
      lmap('<leader>lgd', vim.lsp.buf.definition, "[d]efinition")
      lmap('<leader>lgD', vim.lsp.buf.declaration, "[D]eclaration")
      lmap('<leader>lgi', vim.lsp.buf.implementation, "[i]mplementation")
      lmap('<leader>lgr', vim.lsp.buf.references, "[r]eferences")
      lmap('<leader>lgt', vim.lsp.buf.type_definition, "[t]ype definition")

      -- Workspace

      lmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, "[a]dd")
      lmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, "[r]emove")
      lmap('<leader>lwl', vim.lsp.buf.list_workspace_folders, "[l]ist")

      -- Diagnostics
      lmap('<leader>ldo', vim.diagnostic.open_float, "[o]pen")
      lmap('<leader>ldp', vim.diagnostic.goto_prev, "[p]revious")
      lmap('<leader>ldn', vim.diagnostic.goto_next, "[n]ext")
      lmap('<leader>ldl', vim.diagnostic.setloclist, "[l]ist")

      -- Actions
      lmap('<leader>ca', vim.lsp.buf.code_action, "[a]ction")
      lmap('<leader>lr', vim.lsp.buf.rename, "[r]ename")
      lmap('<leader>lf', vim.lsp.buf.format, "[f]ormat")
    end,
  })


  -- Capabilities
  local capabilities = cmp.default_capabilities()

  -- Default Mason config
  masonlsp.setup_handlers({
    function(lsp_server)
      lsp[lsp_server].setup({
        capabilities = capabilities
      })
    end
  })

  -- Generic servers without Mason
  lsp.ocamllsp.setup {} -- OCaml
  lsp.nixd.setup {}     -- Nix


  -- Specific lsp configs

  -- Typescript
  lsp.ts_ls.setup {
    capabilities = capabilities,
    root_dir = lsp.util.root_pattern("package.json"),
    filetypes = { "javascript", "typescript", "typescriptreact", "typescrip.tsx" },
  }

  -- Svelte
  lsp.svelte.setup {
    capabilities = capabilities,
    root_dir = lsp.util.root_pattern("package.json"),
    filetypes = { "svelte" }
  }

  -- Deno
  lsp.denols.setup {
    capabilities = capabilities,
    root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
  }

  -- Helm
  lsp.helm_ls.setup {
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


local specs = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "folke/neodev.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = lsp_config
}

return specs
