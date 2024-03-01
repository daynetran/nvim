-- https://github.com/nvim-lualine/lualine.nvim
-- a configurable NeoVim statusline written in Lua.

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local lualine = require("lualine")
        lualine.setup {}
    end
}
