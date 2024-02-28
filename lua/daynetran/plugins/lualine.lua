return
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local lualine = require("lualine")
            lualine.setup {
                options = { themes = 'ayu_mirage'},
            }
        end
    }
