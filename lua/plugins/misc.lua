return {
  {
    'christoomey/vim-tmux-navigator',
  },
  {
    'tpope/vim-sleuth',
  },
  -- NOTE: check this plugin
  {
    'tpope/vim-fugitive',
  },
  -- NOTE: check the single use
  {
    'tpope/vim-rhubarb',
  },
  -- WARN: i think i dont need this one
  {
    'folke/which-key.nvim',
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    -- NOTE: This is useful! check it later
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = true },
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
}
