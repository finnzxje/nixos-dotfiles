return function()
	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})
	vim.lsp.enable("lua_ls")

	vim.lsp.enable("nixd")
	vim.lsp.enable("tinymist")

	local harper_dict_path = vim.fn.expand("~/.config/nvim/spell/en.utf-8.add")
	vim.lsp.config("harper_ls", {
		filetypes = { "markdown", "typst" },
		settings = {
			["harper-ls"] = {
				userDictPath = harper_dict_path,
			},
		},
	})
	vim.lsp.enable("harper_ls")
	vim.lsp.enable("gopls")
end
