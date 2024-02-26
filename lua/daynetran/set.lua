vim.opt.guicursor = {
    "n-v-c:block", -- normal, visual, command-line: block cursor
    "i-ci-ve:ver25", -- insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
    "r-cr:hor20", -- replace, command-line replace: horizontal bar cursor with 20% height
    "o:hor50", -- operator-pending: horizontal bar cursor with 50% height
    "a:blinkwait700-blinkoff400-blinkon250", -- all modes: blinking settings
    "sm:block-blinkwait175-blinkoff150-blinkon175", -- showmatch: block cursor with specific blinking settings
}

-- Enable relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- set tabs to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- enable autoindenting and set it to spaces
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- enable smart indenting
vim.opt.breakindent = true

-- enable incrementral searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- disable text wrap
vim.opt.wrap = false

-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- enable mouse mode
vim.opt.mouse = "a"

-- enable ignorecase + smartcase for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- decrease updatetime to 200 ms
vim.opt.updatetime = 50

-- set completeopt to have a better completion experience
-- menuone enables the autocomplete popup menu
-- noselect prevents the first item preselection
vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- enable 24-bit color
vim.opt.termguicolors = true

-- always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8

-- enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- enable cursor line highlight
vim.opt.cursorline = true

-- eanble access to system clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- place a column line
vim.opt.colorcolumn = "80"

vim.opt.isfname:append("@-@") 
