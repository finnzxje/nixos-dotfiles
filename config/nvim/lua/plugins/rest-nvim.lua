return {
  "mistweaverco/kulala.nvim",
  lazy = true,
  keys = {
    { "<leader>rs", desc = "Send request" },
    { "<leader>ra", desc = "Send all requests" },
    { "<leader>rb", desc = "Open scratchpad" },
  },
  ft = { "http", "rest" },
  opts = {
    -- your configuration comes here
    global_keymaps = true,
    global_keymaps_prefix = "<leader>r",
    kulala_keymaps_prefix = "",
    ui = {
      ---@type kulala.ui.win_config
      win_opts = {
        width = 80,
        height = 20,
        -- split = "vertical",
        -- bo = { number = true, wrap = true }, -- buffer options
        wo = { foldmethod = "expr" }, -- window options
      },
    },
  },
}
