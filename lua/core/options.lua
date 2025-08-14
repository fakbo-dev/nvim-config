-- Editor settings
vim.deprecate = function() end
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.winborder = "rounded"

vim.wo.number = true
vim.o.relativenumber = true
vim.wo.signcolumn = "yes:1"
vim.o.cursorline = false
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "setlocal colorcolumn=80",
})
vim.o.splitright = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.opt.termguicolors = true

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.confirm = true
vim.o.wrap = false
vim.o.linebreak = true
vim.o.mouse = "a"
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.showmode = false
vim.o.whichwrap = "bs<>[]hl"
vim.o.numberwidth = 4
vim.o.swapfile = false
vim.o.smartindent = true
vim.o.showtabline = 0
vim.o.backspace = "indent,eol,start"
vim.o.pumheight = 10
vim.o.conceallevel = 1
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 1
vim.o.breakindent = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.completeopt = "menuone,noselect"
vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
vim.opt.guicursor = ""
