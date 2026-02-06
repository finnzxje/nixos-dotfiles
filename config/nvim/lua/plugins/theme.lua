return {
	{ "catppuccin/nvim", lazy = true },
	{ "sainnhe/gruvbox-material", lazy = true },

{
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		vim.o.background = "dark"
		vim.cmd.colorscheme("catppuccin-macchiato")
	end,
},
}
