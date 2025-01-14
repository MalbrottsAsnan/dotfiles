-- The starting point for the plugin configuration with lazy.nvim
return { 
	-- First load the mini.nvim plugin so that its modules can be set up in individual files
	{ 'echasnovski/mini.nvim', version = false },	

	-- Import plugin categories, lazy.nvim will run all *lua files and load any returned tables
	{ import = "plugins/style" },
	{ import = "plugins/view" },
	{ import = "plugins/edit" },
	{ import = "plugins/utility" },
	{ import = "plugins/workflow" },
	{ import = "plugins/lsp" },
}
