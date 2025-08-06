-- In your lazy.nvim plugins.lua file
return {
  -- Oil.nvim plugin
  {
    'stevearc/oil.nvim',
    opts = {}, -- Your oil.nvim configuration goes here
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- Custom code to automatically open oil on startup
  {
    'folke/lazy.nvim', -- A dummy plugin to create a config block
    name = 'autocmd-oil',
    dependencies = {
      'stevearc/oil.nvim',
    },
    config = function()
      -- Function to get the directory to open oil in
      local function get_directory_to_open()
        -- Get the current buffer name
        local buffer_name = vim.api.nvim_buf_get_name(0)

        -- If the buffer has a name (i.e., we opened a file)
        if buffer_name and buffer_name ~= '' then
          -- Get the directory of the current buffer
          local file_path = vim.fn.fnamemodify(buffer_name, ':h')
          if vim.fn.isdirectory(file_path) == 1 then
            return file_path
          end
        end

        -- Otherwise, return the current working directory
        return vim.fn.getcwd()
      end

      -- The autocmd to run on startup
      vim.api.nvim_create_autocmd('VimEnter', {
        once = true,
        callback = function()
          local no_explicit_files = #vim.v.argv == 0
          local opened_with_directory = (#vim.v.argv == 1 and vim.fn.isdirectory(vim.v.argv[1]) == 1)

          if no_explicit_files or opened_with_directory then
            -- We've confirmed we want to open a directory explorer.
            -- Now, find the right directory and open it with oil.
            local dir_to_open = get_directory_to_open()
            if pcall(require, 'oil') then
              -- We need a short delay to ensure Oil can properly initialize
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
