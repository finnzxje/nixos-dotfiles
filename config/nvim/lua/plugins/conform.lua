return {
	"stevearc/conform.nvim",
	event = "BufWritePre", -- uncomment for format on save
	lazy = false,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			markdown = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier", stop_after_first = true },
			yaml = { "yamlfmt" },
			python = { "isort" },
			nix = { "alejandra" },
			kdl = { "kdlfmt" },
			http = { "kulala-fmt" },
		},

		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		}),
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		}),
	},
	keys = {
		{
			"<leader>tf",
			function()
				-- If autoformat is currently disabled for this buffer,
				-- then enable it, otherwise disable it
				if vim.b.disable_autoformat then
					vim.cmd("FormatEnable")
					vim.notify("Enabled autoformat for current buffer")
				else
					vim.cmd("FormatDisable!")
					vim.notify("Disabled autoformat for current buffer")
				end
			end,
			desc = "Toggle autoformat for current buffer",
		},
	},
}
