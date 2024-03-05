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
        -- Every time a new file is opened that is associated with an LSP, this
        -- function will be executed to configure the current buffer.
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function (event)
                -- A local function that allows easier map definitions specific to LSP-related
                -- items. It sets the mode, buffer, and description every time.
                local map = function (keys, func, desc)
                    vim.keymap.set('n', keys, func, {buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                -- Go to the definition of the word under your cursor. 
                -- This is where a variable was first declared, or where a function is defined, etc.
                -- To jump back, press <C-T>.
                map('<leader>gd', require('telescope.builtin').lsp_definitions, '[g]oto [d]efinition')

                -- Go to references under your cursor.
                map('<leader>gr', require('telescope.builtin').lsp_references, '[g]oto [r]eferences')

                -- Go to the implementation of the word under your cursor.
                -- Useful when your language has ways of declaring types without an actual implementation.
                map('<leader>gi', require('telescope.builtin').lsp_implementations, '[g]oto [i]mplementations')

                -- Go to the type of word under your cursor.
                -- Useful when you are not sure what type a variable is and you want to see the 
                -- definition of its *type*, not where it was *defined*.
                map('<leader>gt', require('telescope.builtin').lsp_type_definitions, '[g]oto [t]ypes')

                -- Execute a code action
                map('<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')

                -- Rename the variable under the cursor.
                map('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')

                -- Open a popup that displays documentation about the word under your cursor.
                map('H', vim.lsp.buf.hover, '[h]over documentation')

                -- Go to symbols in the current document.
                -- Symbols are things like variables, functions, types, etc.
                map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[d]ocument [s]ymbols')

                -- Go to symbols in the current workspace.
                map('<leader>ws', require('telescope.builtin').lsp_workspace_symbols, '[w]orkspace [s]ymbols')
            end
        })


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

