MiniDeps.add({ source = "folke/lazydev.nvim"})

require("lazydev").setup({
	library = {
		{ path = "luvit-meta/library", words = { "vim%.uv" }},
	},
})
