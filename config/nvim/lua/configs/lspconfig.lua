return function()
	vim.lsp.enable("lua_ls")
	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})

	vim.lsp.enable("nixd")
	vim.lsp.enable("tinymist")
end
