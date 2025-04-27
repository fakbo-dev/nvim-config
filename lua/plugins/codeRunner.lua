return {
  'CRAG666/code_runner.nvim',
  config = function()
    require('code_runner').setup {
      filetype = {
        python = 'python3 -u',
        javascript = 'node',
        java = 'cd $dir && javac $fileName && java $fileNameWithoutExt',
        typescript = 'cd $dir && ts-node --esm $fileName',
        --Alternative approach
        --typescript = 'npx ts-node --esm $fileName',
        --typescript = 'node --loader ts-node/esm $fileName',
      },
      project = {
        ['~/projects/'] = 'npm start',
      },
    }

    vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = true })
  end,
}
