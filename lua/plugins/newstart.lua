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
  },
}
