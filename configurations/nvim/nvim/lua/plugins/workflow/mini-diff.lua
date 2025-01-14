-- Set up the mini.nvim module
require("mini.diff").setup()

-- TODO: Describe this behaviour
vim.keymap.set("n", "<Leader>td", "<cmd>lua MiniDiff.toggle_overlay()<CR>", { desc = "[T]oggle Mini.Diff overlay" })

-- Return empty table to lazy.nvim
return {}
