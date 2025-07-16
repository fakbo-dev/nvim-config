return {
  'elihunter173/dirbuf.nvim',
  config = function()
    -- Ensure dirbuf is set up.
    -- We're still setting disable_keymaps, even if it doesn't solve it alone,
    -- as it's the intended way to prevent default mappings.
    require('dirbuf').setup {}

    -- Explicitly unmap '-' in Normal mode
    -- This should run *after* the plugin has potentially set its default mappings.
    vim.keymap.del('n', '-')

    -- Your buffer-local keymap for syncing with <C-s> - KEEP THIS!
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'dirbuf',
      callback = function()
        vim.keymap.set('n', '<C-s>', function()
          vim.cmd 'DirbufSync -confirm' -- Call the DirbufSync command with -confirm flag
        end, { buffer = true, desc = 'Dirbuf: Sync changes with confirmation' })
      end,
    })
  end,
}
