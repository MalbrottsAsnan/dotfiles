return {
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {
			-- HACK: Custom indentation characters
			indent = {
				-- Character, or list of characters, that get used to display the indentation guide
				char = "╎",
			},

			scope = {
				-- Shows an underline on the first line of the scope
				show_start = false,

				-- Shows an underline on the last line of the scope
				show_end = false,
			},
		},
	},
}
