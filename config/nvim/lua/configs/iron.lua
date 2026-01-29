local M = {}

function M.setup()
  local iron = require("iron.core")
  local view = require("iron.view")
  local common = require("iron.fts.common")

  iron.setup({
    config = {
      scratch_repl = true,
      repl_definition = {
        sh = {
          command = { "zsh" },
        },
        python = {
          command = { "ipython", "--no-autoindent" },
          -- command = { "python3.13" },
          format = common.bracketed_paste_python,
          block_dividers = { "# %%", "#%%" },
          env = { PYTHON_BASIC_REPL = "1" },
        },
      },
      repl_filetype = function(_, ft)
        return ft
      end,
      dap_integration = true,
      -- repl_open_cmd = view.bottom(40),
      repl_open_cmd = {
        view.split.vertical.rightbelow("%40"), -- cmd_1: open a repl to the right
        -- view.split.rightbelow("%25")  -- cmd_2: open a repl below
      }
    },
    keymaps = {
      toggle_repl = "<space>rr",
      restart_repl = "<space>rR",
      send_motion = "<space>sc",
      visual_send = "<space>sc",
      send_file = "<space>sf",
      send_line = "<space>sl",
      send_paragraph = "<space>sp",
      send_until_cursor = "<space>su",
      send_mark = "<space>sm",
      send_code_block = "<space>sb",
      send_code_block_and_move = "<space>sn",
      mark_motion = "<space>mc",
      mark_visual = "<space>mc",
      remove_mark = "<space>md",
      cr = "<space>s<cr>",
      interrupt = "<space>s<space>",
      exit = "<space>sq",
      clear = "<space>cl",
    },
    highlight = {
      italic = true,
    },
    ignore_blank_lines = true,
  })

  vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")
  vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
end

return M
