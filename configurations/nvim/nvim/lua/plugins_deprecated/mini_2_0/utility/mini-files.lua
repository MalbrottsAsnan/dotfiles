-- HACK: not using preview option, i use pickers for that instead
require("mini.files").setup()

vim.keymap.set("n", "<S-M-k>", "<cmd>lua MiniFiles.open()<CR>", { desc = "File exporer" })
