vim.deprecated = function() end
require 'core.options'
require 'core.keymaps'
require 'core.snippets'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.neo-tree',
  --require 'plugins.nord',
  --require 'plugins.presence',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.completion',
  require 'plugins.no-ls',
  require 'plugins.gitsigns',
  require 'plugins.alpha',
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  require 'plugins.codeRunner',
  --require 'plugins.neocord',
  require 'plugins.themes',
  require 'plugins.transparency',
  --require 'plugins.typescriptServer',
  require 'plugins.mason-tempo',
  require 'plugins.presence-vyfor',
}
