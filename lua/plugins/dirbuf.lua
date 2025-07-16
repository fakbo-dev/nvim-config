return {
  'elihunter173/dirbuf.nvim',
  config = function()
    require('dirbuf').setup {}

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'dirbuf',
      callback = function()
        vim.keymap.set('n', '<C-s>', function()
          vim.cmd 'DirbufSync -confirm'
        end, { buffer = true, desc = 'Dirbuf: Sync changes with confirmation' })
      end,
    })
  end,
}
