    require("mini.map").setup({
	symbols = {
	    encode = require("mini.map").gen_encode_symbols.dot("4x2"),
	},
	integrations = {
	    require("mini.map").gen_integration.builtin_search(),
	    require("mini.map").gen_integration.gitsigns(),
	    require("mini.map").gen_integration.diagnostic(),
	},
	window = {
	    show_integration_count = false,

	    winblend = 10,
	},
    })



    vim.keymap.set("n", "<Leader>tm", MiniMap.toggle, { desc = "Toggle map"})
    vim.keymap.set("n", "<Leader>tf", MiniMap.toggle_focus, { desc = "Toggle map focus"})
    vim.keymap.set("n", "<Leader>ts", MiniMap.toggle_side, { desc = "Toggle map side"})

            -- HACK: Autocommand on file open
            vim.api.nvim_create_autocmd({ "BufAdd", "BufRead", "BufNewFile" }, {
                callback = function()
                    MiniMap.open()
                end,
            })
