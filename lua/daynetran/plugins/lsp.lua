-- https://github.com/neovim/nvim-lspconfig
-- configurations for the NeoVim Language Server Protocol client

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim"
    },
    config = function()
        -- automaticallly configures the Lua language server for NeoVim config, runtime, and plugins 
        require("neodev").setup()

        -- manages external editing tools like LSP servers, DAP servers, linters, and formatters
        require("mason").setup()

        -- closes some gaps between mason.nvim and lspconfig, like providing 
        -- :LspInstall, automatically configuring a predefined list of servers,
        -- and translating between lspconfig names and mason.nvim package names
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "tsserver",
                "tailwindcss",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup{}
                end,
            }
        })
    end
}

