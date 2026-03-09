-- Navigate and manipulate the file system
local files = require('mini.files')
files.setup()

vim.keymap.set("n", "<S-M-k>", "<cmd>lua MiniFiles.open()<CR>", { desc = "File exporer" })

-- Return empty table to lazy.nvim since the main mini.nvim module is already set up
return {}
