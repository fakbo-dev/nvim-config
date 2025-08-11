 return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { {'nvim-tree/nvim-web-devicons'}, {'ibhagwan/fzf-lua'} },
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = { enable = true },
        shortcut = {
          { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          -- { desc = ' Dotfiles', group = 'Number', action = 'FzfLua files cwd=~/dotfiles', key = 'd' },
        },
        project = {
          enable = false,
          limit = 5,
          icon = ' ',
          label = '',
          items = {
            -- { desc = ' Empty Project', cwd = '', action = 'FzfLua files' },
            -- { desc = '󰉖 Configs', cwd = '/home/vidan/.config', action = 'FzfLua files cwd=/home/vidan/.config' },
            -- { desc = ' Dotfiles', cwd = '/home/vidan/dotfiles', action = 'FzfLua files cwd=/home/vidan/dotfiles' },
            -- { desc = ' Scripts', cwd = '/home/vidan/scripts', action = 'FzfLua files cwd=/home/vidan/dotfiles/hypr/.config/hypr/scripts' },
            -- { desc = ' Downloads', cwd = '/home/vidan/Downloads', action = 'FzfLua files cwd=/home/vidan/Downloads' },
          }
        },
        mru = { enable = false, limit = 4 },
        footer = { 'using this until i find a minimal config' }
      },
    }
  end
}
