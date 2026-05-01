return {
	"nvim-treesitter/nvim-treesitter-context",
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {
			-- this shit is backwards lol
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		},
	},
}
