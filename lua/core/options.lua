-- Editor settings
vim.deprecated = function() end
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.tabstop = 2 -- Insert 2 spaces for a tab
vim.o.softtabstop = 2 -- Number of spaces that a tab counts for
vim.o.shiftwidth = 2 -- Number of spaces inserted for indentation
-- UI configuration
vim.wo.number = true -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers
vim.wo.signcolumn = 'yes:1' -- Merge sign column with number column
vim.o.cursorline = false -- Disable cursor line highlight
vim.o.scrolloff = 10 -- Minimum lines to keep above/below cursor
vim.o.sidescrolloff = 8 -- Minimum columns to keep beside cursor

-- Window management
vim.o.splitbelow = true -- New windows go below
vim.o.splitright = true -- New windows go right

-- Visual enhancements
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
vim.opt.termguicolors = true -- Enable true color support

-- second Block of configuration
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.confirm = true
vim.o.wrap = false
vim.o.linebreak = true
vim.o.mouse = 'a'
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.showmode = false
vim.o.whichwrap = 'bs<>[]hl'
vim.o.numberwidth = 4
vim.o.swapfile = false
vim.o.smartindent = true
vim.o.showtabline = 0 --change to 2 if want bufferline
vim.o.backspace = 'indent,eol,start'
vim.o.pumheight = 10
vim.o.conceallevel = 0
vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 1
vim.o.breakindent = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.completeopt = 'menuone,noselect'
vim.opt.shortmess:append 'c'
vim.opt.iskeyword:append '-'
vim.opt.formatoptions:remove { 'c', 'r', 'o' }
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles'
