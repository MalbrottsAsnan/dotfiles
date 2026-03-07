require('mini.diff').setup()

-- HACK: COMMENT THIS:!
vim.keymap.set("n", "<Leader>td", "<cmd>lua MiniDiff.toggle_overlay()<CR>", { desc = "[T]oggle Mini.Diff overlay" })
