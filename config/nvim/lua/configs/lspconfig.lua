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

	-- local harper_dict_path = vim.fn.expand("~/.config/nvim/spell/en.utf-8.add")
	-- vim.lsp.config("harper_ls", {
	-- 	filetypes = { "markdown", "typst" },
	-- 	settings = {
	-- 		["harper-ls"] = {
	-- 			userDictPath = harper_dict_path,
	-- 			linters = {
	-- 				SentenceCapitalization = false,
	-- 				UseTitleCase = false,
	-- 			},
	-- 		},
	-- 	},
	-- })
	-- vim.lsp.enable("harper_ls")
	vim.lsp.enable("gopls")
	vim.lsp.config.bashls = {
		cmd = { "bash-language-server", "start" },
		filetypes = { "bash", "sh", "zsh" },
	}
	vim.lsp.enable("bashls")
	vim.lsp.config["pyright"] = {
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_markers = {
			"pyproject.toml",
			"setup.py",
			"setup.cfg",
			"requirements.txt",
			"Pipfile",
			"pyrightconfig.json",
			".git",
		},
		settings = {
			python = {},
		},
	}
	vim.lsp.enable("pyright")
	vim.lsp.enable("ruff")
	vim.lsp.enable("ts_ls")
	vim.lsp.enable("clangd")
	vim.lsp.enable("marksman")
end
