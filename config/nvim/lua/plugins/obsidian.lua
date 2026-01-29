return
{
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "saghen/blink.cmp",
    "MeanderingProgrammer/render-markdown.nvim"
  },
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "personal",
        path = "~/documents/obsidian-vault/finn",
      },
    },
    note_subdir = "06-Notes",
    new_note_location = "note_subdir",
    -- disable_frontmatter = true,
    frontmatter = {
      enabled = false
    },

    picker = {
      name = "snacks.pick",
    },

    templates = {
      subdir = "05-Template",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },
    completion = {
      blink = true,
      min_chars = 2,
      -- Set to false to disable new note creation in the picker
      create_new = true,
    },
    ui = {
      enable = true,
      ignore_conceal_warn = false,
      update_debounce = 200,
      max_file_length = 5000,
      -- Use bullet marks for non-checkbox lists.
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      -- Replace the above with this if you don't have a patched font:
      -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianImportant = { bold = true, fg = "#d73128" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },
    checkbox = {
      -- order = { " ", "~", "!", ">", "x" },
      order = { " ", "x" },
    },
  },
}
