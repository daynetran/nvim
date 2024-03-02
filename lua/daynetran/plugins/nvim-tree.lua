-- https://github.com/nvim-tree/nvim-tree.lua
-- a file explorer tree written in Lua

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}

    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NVimTree" })
    keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFile<cr>", { desc = "Find File in NvimTree" })
    keymap.set("n", "<leader>tft", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Find File and Toggle in NvimTree"})
    keymap.set("n", "<leader>tr", "<cmd>NvimTreeRefresh<cr>", { desc = "Refresh NvimTree" })
    keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<cr>", { desc = "Collapse NvimTree" })
    keymap.set("n", "<leader>tk", "<cmd>NvimTreeCollapseKeepBuffers<cr>", { desc = "Collapse NvimTree and Keep Buffer Dirs Open" })
  end,
}
