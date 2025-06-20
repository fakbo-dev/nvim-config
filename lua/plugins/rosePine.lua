return {
  {
    'rose-pine/neovim',
    name = 'rose-pine', -- LazyVim needs a name for the plugin
    lazy = false, -- Load this plugin immediately
    priority = 10000, -- Ensure it loads before other plugins
    config = function()
      require('rose-pine').setup {
        -- You can choose one of the Rose Pine variants:
        -- "main" (default), "moon", or "dawn"
        -- Example for the default Rose Pine variant:
        variant = 'moon',
        disable_background = true,
        -- Set transparency
        transparent_background = true, -- Rose Pine's option for transparency

        -- You can add other Rose Pine options here if you want to customize it further
        -- Refer to the Rose Pine Neovim GitHub for all options:
        -- https://github.com/rose-pine/neovim#configuration
        -- Example:
        -- dark_variant = "main",
        -- bold_vert_split = false,
        -- dim_inactive_windows = false,
        -- enable = {
        -- },
        styles = {
          transparency = true,
        },
      }
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
}
