-- Installs Lazy, a modern package manager for NeoVim plugins.
--
-- Sets a path where lazy is installed, a standard system data directory path 
-- that appends '/lazy/lazy.nvim'.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Checks if the file system statistics about the plugin path exists.
-- If not, executes an external shell command to clone the plugin from Github.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Adds lazypath to the beginning of the runtimepath, which controls where 
-- NeoVim looks for plugins.
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("daynetran.plugins")
