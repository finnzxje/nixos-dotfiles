vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.bo.softtabstop = 2

vim.opt.clipboard = "unnamedplus"

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 999

vim.opt_local.conceallevel = 2

vim.o.undofile = true


local text_signs = {
  [vim.diagnostic.severity.ERROR] = "󰅚",
  [vim.diagnostic.severity.WARN] = "󰀪",
  [vim.diagnostic.severity.HINT] = "󰌶",
  [vim.diagnostic.severity.INFO] = " ",
}
local sign_hl = {
  [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
  [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
  [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
  [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
}

vim.diagnostic.config({
  float = {
    border = "none",
    scope = "l",
    focusable = false,
    style = "minimal",
    source = true,
    header = "",
    prefix = "",
    severity_sort = true,
  },
  underline = true,
  signs = {
    priority = 16,
    text = text_signs,
    numhl = sign_hl,
  },
  virtual_lines = false,
  virtual_text = {
    prefix = "●",
    source = "if_many",
    hl_mode = "replace",
    virt_text_pos = "eol",
  },
  update_in_insert = false,
})
