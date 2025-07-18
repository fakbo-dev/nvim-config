return {
  {
    'folke/snacks.nvim',
    init = function()
      vim.api.nvim_create_autocmd('VimEnter', {
        once = true,
        callback = function()
          local args = vim.v.argv

          local no_explicit_files = (#vim.api.nvim_list_bufs() == 1 and vim.api.nvim_buf_get_name(0) == '')
          local opened_with_directory_arg = (#args == 1 and vim.fn.isdirectory(args[1]) == 1)

          if no_explicit_files or opened_with_directory_arg then
            if vim.api.nvim_get_mode().mode == 'n' then
              vim.cmd 'Dirbuf'
            end
          end
        end,
      })
    end,

    opts = {
      image = { enabled = false },

      terminal = {
        win = {
          keys = {
            exit = { '<ESC>', '<cmd>q<cr>', desc = 'Exit', expr = true, mode = { 't', 'n' } },
            term_normal = {
              '<c-/>',
              function(self)
                vim.cmd 'stopinsert'
                local timer = vim.loop.new_timer()
                local start_up_func = function()
                  vim.api.nvim_feedkeys('/', 'n', true)
                end
                if timer ~= nil then
                  timer:start(10, 0, vim.schedule_wrap(start_up_func))
                end
              end,
              mode = { 't', 'n' },
              expr = true,
              desc = 'Double escape to normal mode',
            },
            hide_search_highlight = {
              '<c-.>',
              '<cmd>noh<cr>',
              desc = 'Turn off highlighting until the next search',
              expr = true,
              mode = { 't', 'n' },
            },
          },
        },
      },

      picker = {
        sources = {
          explorer = {
            path = vim.fn.getcwd(),
            auto_close = true,
            layout = {
              preset = 'vscode',
              layout = { position = 'right' },
            },
          },
        },
      },

      dashboard = {
        on_close = function() end,
        preset = {
          header = false,
          pick = nil,
          keys = {
            {
              icon = ' ',
              key = 'p',
              desc = 'Projects',
              action = function()
                Snacks.picker.projects {
                  sort = { fields = { 'time:asc', 'idx' } },
                  on_close = function(info) end,
                }
              end,
            },
            {
              icon = ' ',
              key = 'c',
              desc = 'Config',
              action = function()
                Snacks.dashboard.pick('files', {
                  cwd = vim.fn.stdpath 'config',
                  on_close = function(info) end,
                })
              end,
            },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },
        },
        sections = {
          { section = 'keys',    gap = 1,        padding = 1 },
          { section = 'startup', enabled = false },
        },
      },
    },
  },
}
