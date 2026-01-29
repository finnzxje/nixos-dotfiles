local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- miscs
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
-- map("i", "<C-h>", "<Left>", { desc = "move left" })
-- map("i", "<C-l>", "<Right>", { desc = "move right" })
-- map("i", "<C-j>", "<Down>", { desc = "move down" })
-- map("i", "<C-k>", "<Up>", { desc = "move up" })

-- copilot
map("n", "<leader>cst", function()
  require("copilot.suggestion").toggle_auto_trigger()
end, { desc = "Toggle Copilot Suggestions" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })

-- obsidian stuffs
map("n", "<leader>on", ":Obsidian template note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
map("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")
map("n", "<leader>ok", ":!mv '%:p' ~/documents/obsidian-vault/finn/99-zettelkasten<cr>:bd<cr>")
map("n", "<leader>och", "<cmd>Obsidian toggle_checkbox<cr>", { desc = "Toggle checkbox", })
map("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>", { desc = "!Delete file in current buffer" })
map("n", "<leader>bl", ":Obsidian backlinks<cr>", { desc = "Backlinks" })

-- Typst live preview with low latency
map("n", "<leader>lp", ":TypstPreview<CR>", opts)


map("n", "<leader>yd", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
  if #diagnostics > 0 then
    local message = diagnostics[1].message
    vim.fn.setreg('+', message) -- Yank to default register
    print("Yanked: " .. message)
  else
    print("No diagnostic on this line.")
  end
end, { desc = "Yank diagnostic message" })
