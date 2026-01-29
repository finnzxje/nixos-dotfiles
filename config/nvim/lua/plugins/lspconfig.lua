return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				-- "lua_ls",
				"html",
				"cssls",
				"emmet_language_server",
				"tailwindcss",
				"ts_ls",
				"jsonls",
				"eslint",
				"marksman",
				-- "pylsp",
				"pyright",
				"tinymist",
				"yamlls",
				"jdtls",
				"gopls",
				"bashls",
				-- "gh_actions_ls",
				-- "ruff",
			},
		},

		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},

		config = require("configs.lspconfig"),
	},
}
