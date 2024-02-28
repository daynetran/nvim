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
	         	ensure_installed = { "typescript", "css", "javascript", "svelte" },
	        	highlight = { enable = true },
	            })
            end
        end,
}
