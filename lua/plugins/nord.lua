return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false, -- Load this plugin immediately
    priority = 1000, -- Ensure it loads before other plugins that might depend on the colorscheme
    config = function()
      require('gruvbox').setup {
        transparent_mode = true, -- Enable transparent background
        -- You can add other gruvbox options here if you want to customize it further
        -- For example:
        -- contrast = "hard",
        -- palette_overrides = {
        --   dark0 = "#000000",
        -- },
      }
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
}
