vim.opt.termguicolors = true
require 'core.options'
require 'core.keymaps'
require 'core.snippets'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system
  {
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
  require 'plugins.treesitter', -- dont touch
  require 'plugins.telescope', -- dont touch
  require 'plugins.lsp', -- dont touch
  require 'plugins.autocompletion', -- dont touch
  require 'plugins.no-ls', -- dont touch
  require 'plugins.gitsigns', -- dont touch
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  require 'plugins.mason-tempo',
  require 'plugins.obsidian',
  require 'plugins.harpoon',
  require 'plugins.leetcode',
  require 'plugins.oil',
  require 'plugins.lualine',
  require 'plugins.rosePine',
  require 'plugins.markview',
  require 'plugins.csvview',
  require 'plugins.lackluster'
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
