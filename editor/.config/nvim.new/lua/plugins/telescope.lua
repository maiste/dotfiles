-- +-------------------------------+
-- | Neovim - Telescope            |
-- +-------------------------------+
-- | Author: Maiste <dev@maiste.fr |
-- | License: MIT                  |
-- | Version: 20240915             |
-- +-------------------------------+

local nmap = require("core.helpers").nmap

local function project_nvim_config()
  local ok, project_nvim = pcall(require, "project_nvim")
  if not ok then
    print("Project_nvim not found")
    return
  end
  project_nvim.setup({
    patterns = {
      ".git",
      "_opam",
      "_darcs",
      ".hg",
      ".bzr",
      ".svn",
      "Makefile",
      "package.json"
    },
    show_hidden = true,
  })
end

local function aerial_config()
  local ok, aerial = pcall(require, "aerial")
  if not ok then
    print("Aerial not found")
    return
  end
  aerial.setup()
end

local function telescope_mapping(telescope)
  local ok, builtin = pcall(require, "telescope.builtin")
  if not ok then
    print("Telescope.builtin not found")
    return
  end

  nmap("<leader>tb", builtin.buffers, "[b]uffers")
  nmap("<leader>td", builtin.diagnostics, "[d]iagnostic")
  nmap("<leader>tf", function() builtin.find_files({ hidden = true }) end, "[f]iles")
  nmap("<leader>th", builtin.help_tags, "[h]elp")
  nmap("<leader>tk", builtin.keymaps, "[k]eymaps")
  nmap("<leader>tp", telescope.extensions.projects.projects, "[p]rojects")
  nmap("<leader>tr", builtin.live_grep, "[r]igrep")
  nmap("<leader>ts", telescope.extensions.aerial.aerial, "[s]tructure")
  nmap("<leader>tt", builtin.filetypes, "file[t]ypes")
end

local function telescope_config()
  local ok, telescope = pcall(require, "telescope")
  if not ok then
    print("Telescope not found")
    return
  end

  local ok_actions, actions = pcall(require, "telescope.actions")
  if not ok_actions then
    print("Telescope.actions not found")
    return
  end

  project_nvim_config()
  telescope.load_extension('projects')

  aerial_config()
  telescope.load_extension('aerial')

  telescope.setup({
    defaults = require('telescope.themes').get_ivy {
      file_ignore_patterns = { "node_modules", ".git" },
      path_display = {
        smart = 1
      },
      mappings = {
        n = {
          ["q"] = actions.close
        },
        i = {
          ["<C-h>"] = "which_key"
        }
      },
    },
  })

  telescope_mapping(telescope)
end


local specs = {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ahmedkhalf/project.nvim',
    'stevearc/aerial.nvim'
  },
  config = telescope_config
}

return specs
