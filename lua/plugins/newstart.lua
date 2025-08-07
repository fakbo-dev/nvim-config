return {
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  {
    'folke/lazy.nvim',
    name = 'autocmd-oil',
    dependencies = {
      'stevearc/oil.nvim',
    },
    config = function()
      local function get_directory_to_open()
        local buffer_name = vim.api.nvim_buf_get_name(0)

        if buffer_name and buffer_name ~= '' then
          local file_path = vim.fn.fnamemodify(buffer_name, ':h')
          if vim.fn.isdirectory(file_path) == 1 then
            return file_path
          end
        end

        return vim.fn.getcwd()
      end

      vim.api.nvim_create_autocmd('VimEnter', {
        once = true,
        callback = function()
          local no_explicit_files = #vim.v.argv == 0
          local opened_with_directory = (#vim.v.argv == 1 and vim.fn.isdirectory(vim.v.argv[1]) == 1)

          if no_explicit_files or opened_with_directory then
            local dir_to_open = get_directory_to_open()
            if pcall(require, 'oil') then
              vim.defer_fn(function()
                vim.cmd('Oil ' .. dir_to_open)
              end, 100)
            end
          end
        end,
      })
    end,
  },
}
