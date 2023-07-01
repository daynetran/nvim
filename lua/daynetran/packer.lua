-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- telescope.nvim is a highly extendable fuzzy finder over lists.
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	
	-- nvim-treesitter interfaces with treesitter in Neovim, provides more
	-- highlighting and contrast within code.
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- colorscheme
	use ( {
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.cmd('colorscheme catppuccin')
		end
	} )

	-- The ability to specify, or on the fly, mark and create persisting 
	-- key strokes to go to the files you want.
	use { 'ThePrimeagen/harpoon' } 

	-- Undotree visualizes the undo history and makes it easy to browse 
	-- and switch between different undo branches
	use { "mbbill/UndoTree" }

	use { "tpope/vim-fugitive" }

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}
}

end)
