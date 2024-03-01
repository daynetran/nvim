-- https://github.com/nvim-treesitter/nvim-treesitter
-- Treesitter provides a fast, flexible, and accurate way to parse code.
-- The detailed understanding of code structures enables syntax highlighting, 
-- smarter code navigation, and structural editing.

return {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
        config = function()
            local ok, treesitter = pcall(require, "nvim-treesitter.configs")
            if ok then
             	treesitter.setup({
                    -- list of modules ()
	         	    ensure_installed = { "typescript", "css", "html", "vim", "javascript", "svelte" },

                    -- core module that provides syntax highlighting
                    highlight = { enable = true },

                    -- custom module provided from external `nvim-ts-autotag` plugin
                    autotag = { enable = true},

                    -- install parsers synchronously (only applied to `ensure_installed`)
                    sync_install = false,

                    -- automatically install missing parsers when entering buffer
                    auto_install = true,

                    -- list of parsers to ignore installing (or "all") 
                    ignore_install = {},
	            })
            end
        end,
}
