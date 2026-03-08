-- Visualize, apply, and reset git diff hunks
local diff = require('mini.diff')
diff.setup()

vim.keymap.set("n", "<Leader>td", "<cmd>lua MiniDiff.toggle_overlay()<CR>", { desc = "[T]oggle Mini.Diff overlay" })

-- Return empty table to lazy.nvim since the main mini.nvim module is already set up
return {}
