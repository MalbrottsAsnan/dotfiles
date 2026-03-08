-- Define custom tabline structure
local tabline = require('mini.tabline')
tabline.setup({
    show_icons = vim.g.have_nerd_font
})

-- Return empty table to lazy.nvim since the main mini.nvim module is already set up
return {}
