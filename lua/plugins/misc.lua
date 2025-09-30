return {
  {
    'christoomey/vim-tmux-navigator',
  },
  {
    'tpope/vim-sleuth',
  },
  {
    'tpope/vim-rhubarb',
    dependencies = {'tpope/vim-fugitive'},
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = true,
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    colors = {
        error = {  "#DC2626" },
        warning = {"#FBBF24" },
        WARN = {"#FFA500"},
        info = {"#2563EB" },
        hint = { "#10B981"},
        default = {"#7C3AED" },
        test = { "#FF00FF" }
        },
    },

  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    "ecthelionvi/NeoColumn.nvim",
    opts = {always_on = true},
  },
  {
    "ahkohd/buffer-sticks.nvim",
    event = "VeryLazy",
    config = function()
      local sticks = require("buffer-sticks")
      sticks.setup({
        filter = { buftypes = { "terminal" } },
        highlights = {
          active = { link = "Statement" },
          inactive = { link = "Whitespace" },
          label = { link = "Comment" },
        },
      })
      sticks.show()
    end,
}}
