return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require("mini.surround").setup()
      require("mini.ai").setup()
      require("mini.pairs").setup()
      require("mini.statusline").setup()
      require("mini.bufremove").setup()

      -- require("mini.notify").setup()
      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = "java",
      --   callback = function()
      --     -- This variable is checked by mini.notify before showing anything
      --     vim.b.mininotify_disable = true
      --   end,
      -- })
    end
  },
}
