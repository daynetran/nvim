-- https://github.com/hrsh7th/nvim-cmp
-- A completion engine plugin for neovim written in Lua.
-- Completion sources are installed from external repositories and "sourced".

return {
    {
        "hrsh7th/nvim-cmp", -- completion engine
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",       -- connects NeoVim LSP suggestions to nvim-cmp
            "hrsh7th/cmp-buffer",         -- connects buffer content suggestions to nvim-cmp
            "hrsh7th/cmp-path",           -- connects filesystem path suggestions to nvim-cmp

            "saadparwaiz1/cmp_luasnip",   -- connects luasnip suggestions to nvim-cmp
            "L3MON4D3/LuaSnip",           -- a snippet engine
            "rafamadriz/friendly-snippets", -- a set of snippets for different languages

            "hrsh7th/cmp-emoji",          -- connects emoji suggestions to nvim-cmp
            "kdheepak/cmp-latex-symbols", -- connects latex symbol suggestions to nvim-cmp
            "onsails/lspkind.nvim",       -- attaches vscode-like pictograms to nvim-cmp suggestions

            "windwp/nvim-ts-autotag",     -- automatically provides closing tags
            "windwp/nvim-autopairs",      -- autocompletes (), [], {}, etc.
        },

        config = function()
            -- load core completion plugins
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            -- load and setup autopair and autotag plugins
            require("nvim-ts-autotag").setup()
            require("nvim-autopairs").setup()
            -- integrate nvim-autopairs with cmp
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

            -- load snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- configure and start the completion engine
            cmp.setup({
                -- specify a snippet engine
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                -- turn on the completion and documentation windows borders
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                -- specify key mappings
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-j>"] = cmp.mapping.scroll_docs(4), -- scroll down preview
                    ["<C-k>"] = cmp.mapping.scroll_docs(-4), -- scroll up preview
                    ["<C-Space>"] = cmp.mapping.complete({}), -- open completion window 
                    ['<C-s>'] = cmp.mapping.complete({ -- open completion window with Snippets only
                        config = {
                            sources = {
                                { name = 'luasnip' }
                            }
                        }
                    }),
                    ["<C-c>"] = cmp.mapping.abort(), -- close completion window
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- select suggestion
                }),
                -- sources for autocompletion
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- cmp-nvim-lsp 
                    { name = "buffer", max_item_count = 10 }, -- cmp-buffer
                    { name = "copilot" }, -- copilot suggestions
                    { name = "path" }, -- cmp-path 
                    { name = "luasnip" }, -- cmp_luasnip
                    { name = "latex_symbols" }, -- cmp-latex-symbols
                    { name = "emoji" } -- cmp-emoji
                }),
                -- enable pictogram icons for lsp/autocompletion
                formatting = {
                    expandable_indicator = true,
                    format = lspkind.cmp_format({
                        mode = "symbol_text", -- show symbol-then-text annotations
                        maxwidth = 100, -- max width is 100 chars 
                        ellipsis_char = "...", -- when popup menu exceed maxwidth, truncated part shows ellipsis_char
                        symbol_map = { -- override preset symbols
                            Copilot = "",
                        },
                        menu = ({ -- display the source of the completion items
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            latex_symbols = "[Latex]",
                            path = "[Path]",
                            emoji = "[Emoji]",
                            copilot = "[Copilot]"
                        })
                    }),
                },
                experimental = {
                    ghost_text = true,
                },
            })
        end,
    },
}
