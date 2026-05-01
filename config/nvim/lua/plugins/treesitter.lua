local fallback_parsers = {
	"bash",
	"c",
	"css",
	"diff",
	"dockerfile",
	"gitignore",
	"go",
	"gomod",
	"html",
	"java",
	"javascript",
	"jsdoc",
	"json",
	"latex",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"nix",
	"odin",
	"python",
	"query",
	"rust",
	"tsx",
	"typst",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

local enabled_filetypes = {
	"bash",
	"c",
	"css",
	"diff",
	"dockerfile",
	"gitignore",
	"go",
	"gomod",
	"html",
	"java",
	"javascript",
	"json",
	"latex",
	"lua",
	"markdown",
	"nix",
	"odin",
	"python",
	"query",
	"rust",
	"tsx",
	"typst",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ok, treesitter = pcall(require, "nvim-treesitter")

		if ok and type(treesitter.install) == "function" then
			treesitter.setup()

			vim.api.nvim_create_autocmd("FileType", {
				pattern = enabled_filetypes,
				callback = function(args)
					local started = pcall(vim.treesitter.start, args.buf)
					if started then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})

			return
		end

		local configs_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not configs_ok then
			return
		end

		configs.setup({
			ensure_installed = fallback_parsers,
			auto_install = true,
			highlight = { enable = vim.fn.has("nvim-0.12") == 0 },
			indent = { enable = vim.fn.has("nvim-0.12") == 0 },
			modules = {},
			sync_install = false,
			ignore_install = {},
		})
	end,
}
