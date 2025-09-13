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
  -- {
  --   'windwp/nvim-autopairs',
  --   event = 'InsertEnter',
  --   config = true,
  --   opts = {},
  -- },
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
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
    require('kanso').setup({
    bold = true,                 -- enable bold fonts
    italics = false,             -- enable italics
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = false},
    statementStyle = {},
    typeStyle = {},
    transparent = true,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { zen = {}, pearl = {}, ink = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    background = {               -- map the value of 'background' option to a theme
        dark = "ink",           -- try "zen", "mist" or "pearl" !
        light = "ink"           -- try "zen", "mist" or "pearl" !
    },
    foreground = "default",      -- "default" or "saturated" (can also be a table like background)
})

-- setup must be called before loading
-- vim.cmd("colorscheme kanso")
    end
  }
}
