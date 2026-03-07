MiniDeps.add({ 
	source = "neovim/nvim-lspconfig",
	depends = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"j-hui/fidget.nvim",
		"hrsh7th/cmp-nvim-lsp"
	}
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event) 

	
    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
	local highlight_augroup =
	    vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	    buffer = event.buf,
	    group = highlight_augroup,
	    callback = vim.lsp.buf.document_highlight,
	})

	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	    buffer = event.buf,
	    group = highlight_augroup,
	    callback = vim.lsp.buf.clear_references,
	})

	vim.api.nvim_create_autocmd("LspDetach", {
	    group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
	    callback = function(event2)
		vim.lsp.buf.clear_references()
		vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
	    end,
	})
    end
end})


            -- LSP servers and clients are able to communicate to each other what features they support.
            --  By default, Neovim doesn't support everything that is in the LSP specification.
            --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
            --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local servers = { lua_ls = {
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			}
		}
	}
}}

require("mason").setup()



-- You can add other tools here that you want Mason to install
-- for you, so that they are available from within Neovim.
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
"stylua", -- Used to format Lua code
})
-- require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

require("mason-lspconfig").setup({
handlers = {
    function(server_name)
	local server = servers[server_name] or {}
	-- This handles overriding only values explicitly passed
	-- by the server configuration above. Useful when disabling
	-- certain features of an LSP (for example, turning off formatting for ts_ls)
	server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
	require("lspconfig")[server_name].setup(server)
    end,
},
})
