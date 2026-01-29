return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  opt = {
    {
      ignore_install = {},
      ensure_installed = {
        "json",
        "typst",
        "vimdoc",
        "go",
        "rust",
        "dockerfile",
        "c",
        "lua",
        "python",
        "html",
        "css",
        "javascript",
        "typescript",
        "markdown",
        "latex",
        "gitignore",
        "yaml",
        "html",
        "java",
      },
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      modules = {},
      sync_install = true,
      auto_install = true,

      incremental_selection = {
        enable = false,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    },
  },
}
