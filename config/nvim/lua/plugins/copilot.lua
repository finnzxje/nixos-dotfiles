return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    filetypes = {
      yaml = true,
      markdown = true,
    },
    suggestion = {
      enabled = true,
      auto_trigger = false,
      keymap = {
        accept = "<C-l>",
      }
    }
  }
}
