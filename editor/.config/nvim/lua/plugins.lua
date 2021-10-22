-- +---------------------------+
-- | Plugins                   |
-- +---------------------------+
-- | Author: Étienne Marais    |
-- | Version: 20220103         |
-- +---------------------------+

-- Import packer and setup
return require('packer').startup(function()


    -- Import packer within itself {{
    use {'wbthomason/packer.nvim', opt = true}
    -- }}

    -- Useful functions for lua {{
    use { 'nvim-lua/plenary.nvim' }
    -- }}

    -- Fuzzy finder in lua version {{
    use {
    'nvim-telescope/telescope.nvim',
          requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- }}

    -- LSP feature {{
    use { 'neovim/nvim-lspconfig' }
    -- }}

    -- Completion {{
    use { 'hrsh7th/nvim-cmp' } -- Completion
    use { 'hrsh7th/cmp-nvim-lsp' } -- LSP sources
    use { 'hrsh7th/cmp-buffer' } -- Buffer source
    use { 'hrsh7th/cmp-path' }  -- Path source
    use { 'hrsh7th/cmp-cmdline' } -- Cmdline source
    -- }}

    -- Treesitter {{
    use { 'nvim-treesitter/nvim-treesitter' }
    -- }}

    -- Snippets {{
    use { 'L3MON4D3/LuaSnip' } -- Snippets system
    use { 'saadparwaiz1/cmp_luasnip' } -- Completion with nvim-cmp
    -- }}

    -- Text manipulation {{
    use { 'tpope/vim-commentary' } -- Comment management
    use { 'tpope/vim-surround' } -- Surrounding management
    use { 'windwp/nvim-autopairs' } -- Autopairing management
    -- }}

  -- UI {{
    use { 'kyazdani42/nvim-web-devicons' } -- Dev icon
    use { 'shaunsingh/nord.nvim' } -- Nord theme
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    } -- Use lualine
    -- }}

    -- Git {{
    use { 'tpope/vim-fugitive' }
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup()
      end
    }
    -- }}

    -- LaTex {{
    use { 'lervag/vimtex' } -- Ehance TeX in Vim
    -- }}

    -- Markdown {{
    use { 'junegunn/goyo.vim' } -- Distraction free mode
    use { 'iamcco/markdown-preview.nvim' } -- Previem mode
    -- }}

end)
