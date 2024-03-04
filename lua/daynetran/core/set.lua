-- Set leader key to `space`.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.guicursor = {
    "n-v-c:block", -- normal, visual, command-line: block cursor
    "i-ci-ve:ver25", -- insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
    "r-cr:hor20", -- replace, command-line replace: horizontal bar cursor with 20% height
    "o:hor50", -- operator-pending: horizontal bar cursor with 50% height
    "a:blinkwait700-blinkoff400-blinkon250", -- all modes: blinking settings
    "sm:block-blinkwait175-blinkoff150-blinkon175", -- showmatch: block cursor with specific blinking settings
}

vim.opt.title = true

vim.opt.pumblend = 17
vim.opt.wildmode = "longest:full"
vim.opt.wildoptions = "pum"


-- Enable relative line numbers.
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set 1 tab to 4 spaces.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Enable auto- and smart-indents and set to 4 spaces.
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 4

-- Enable incremental search and highliight all matches.
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Disable text wrap.
vim.opt.wrap = false

-- better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse support for all modes.
vim.opt.mouse = "a"

-- Ignore case but override if the search pattern contains upper case characters.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- decrease updatetime to 200 ms
vim.opt.updatetime = 50

-- Configures a better completion experience.
-- "menuone" enables the autocomplete popup menu. 
-- "noselect" prevents preselecting the first item from the menu.
vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Enable 24-bit color.
vim.opt.termguicolors = true

-- Keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8

-- enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- enable cursor line highlight
vim.opt.cursorline = true

-- Enable access to system clipboard.
vim.opt.clipboard = "unnamed,unnamedplus"

-- place a column line
vim.opt.colorcolumn = { "80", "100", "140" }

vim.opt.isfname:append("@-@")
