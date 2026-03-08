-- Set up the mini.nvim module
require("mini.files").setup() -- Not using preview option, use pickers for that instead

-- TODO: Better description?
-- TODO: Go through the documentation and see if there's any more hooks/goodies to add :)
vim.keymap.set("n", "<S-M-k>", "<cmd>lua MiniFiles.open()<CR>", { desc = "File exporer" })

-- Return empty table to lazy.nvim
return {}
