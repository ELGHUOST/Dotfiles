local opt = vim.opt

-- Apparence
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Comportement
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.clipboard = "unnamedplus"

-- Fichiers
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Apparence UI
opt.showmode = false
opt.pumheight = 10
opt.conceallevel = 0
