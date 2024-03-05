-- https://github.com/stevearc/conform.nvim
-- A formatter plugin for NeoVim.

return {
    'stevearc/conform.nvim',
    opts = {
        notify_on_error = false,
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            lua = { 'stylua' },
            javascript = { 'prettier' },
            python = { 'isort' },
        },
    },
}
