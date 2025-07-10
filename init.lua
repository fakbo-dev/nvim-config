vim.opt.termguicolors = true
require 'core.options'
require 'core.keymaps'
require 'core.snippets'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require 'plugins.lualine',
  require 'plugins.neo-tree',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.completion',
  require 'plugins.no-ls',
  require 'plugins.gitsigns',
  require 'plugins.startMenu',
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  require 'plugins.transparency',
  require 'plugins.mason-tempo',
  require 'plugins.presence-vyfor',
  require 'plugins.obsidian',
  require 'plugins.nvim-cpm',
  --require 'plugins.rosePine',
  require 'plugins.vim-be-good',
  require 'plugins.harpoon',
  require 'plugins.leetcode',
  require 'plugins.ts-autotag',
  require 'plugins.vague',
  --require 'plugins.kanagawa',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
