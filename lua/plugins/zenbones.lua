return {
  'zenbones-theme/zenbones.nvim',
  dependencies = 'rktjmp/lush.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.zenbones_darken_comments = 45

    vim.cmd.colorscheme 'rosebones'
    vim.api.nvim_set_hl(0, 'Normal', { bg = '#000000' })

    vim.api.nvim_set_hl(0, 'LineNr', { bg = '#000000' })
    vim.api.nvim_set_hl(0, 'FoldColumn', { bg = '#000000' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = '#000000' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = '#000000' })
  end,
}
