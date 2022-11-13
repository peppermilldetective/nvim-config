local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

cmd 'syntax enable'
cmd 'filetype plugin indent on'

-- Leader key
g.mapleader = ';'

-- Casings
opt.infercase = true

-- Adjust tabs
opt.expandtab = tue
opt.softtabstop= 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.shiftround = true

-- Setup autoread
g.autoread = true

cmd [[au FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif]]
cmd [[au FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]]

-- set autocomplete opt
opt.completeopt = 'menuone,noselect,noinsert'

-- Adjust search
opt.incsearch = true
opt.magic = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

-- Big history
opt.history = 2000

-- Adjust timeout to fit my speed
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 100

-- Adjust scrolling
opt.scrolloff = 8
opt.sidescrolloff = 5

-- Show ruler
opt.nu = true
opt.relativenumber = true

-- No bells
opt.errorbells = false
opt.visualbell = false

-- Adjust cmd window
opt.showcmd = true
opt.cmdheight = 2
opt.laststatus = 2

-- Remove errant files
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = false

-- QOL features
opt.mouse = 'a'

opt.hidden = true

opt.termguicolors = true

opt.updatetime = 300
opt.redrawtime = 1500

opt.whichwrap = 'h,l,<,>,[,],~'

opt.splitright = true

opt.switchbuf = 'useopen,vsplit'
opt.backspace = 'indent,eol,start'
opt.diffopt = 'filler,iwhite'
opt.makeprg = 'build.bat'
opt.shortmess = 'aoOIqc'

opt.wrap = false

opt.signcolumn = 'yes'
