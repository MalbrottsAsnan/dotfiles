-- TODO: Investigate if this should be configured more

-- Configure Lua LSP for the Neovim config, runtime and plugins
-- used for completion, annotationsa and signatures of Neovim apis
return {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			-- Load luvit types when the 'vim.uv' word is found
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		},
	},
}
