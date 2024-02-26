return {
    "theprimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>h", "<cmd>lua require('harpoon.mark').add_file()<cr>")
        vim.keymap.set("n", "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")

        vim.keymap.set("n", "<C-u>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>")
        vim.keymap.set("n", "<C-i>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>")
        vim.keymap.set("n", "<C-o>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>")
    end,
}
