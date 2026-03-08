-- Show a floating window displaying an overview of the current buffer text
local map = require('mini.map')
map.setup({
    symbols = {
        encode = map.gen_encode_symbols.dot('4x2')
    },
    integrations = {
        map.gen_integration.builtin_search(),
        map.gen_integration.diagnostic(),
        map.gen_integration.diff(),
    },
    window = {
	    show_integration_count = false,
	    winblend = 0,
	},
})

vim.keymap.set("n", "<Leader>tm", MiniMap.toggle, { desc = "Toggle map"})
vim.keymap.set("n", "<Leader>tf", MiniMap.toggle_focus, { desc = "Toggle map focus"})
vim.keymap.set("n", "<Leader>ts", MiniMap.toggle_side, { desc = "Toggle map side"})

-- Autocommand on file open
vim.api.nvim_create_autocmd({ "BufAdd", "BufRead", "BufNewFile" }, {
	callback = function()
		MiniMap.open()
	end,
})

-- Return empty table to lazy.nvim since the main mini.nvim module is already set up
return {}
