-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Create an augroup to manage related autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Define the augroup for CodeCompanion chat settings
local codecompanion_group = augroup("CodeCompanionChat", { clear = true })

autocmd("BufEnter", {
  group = codecompanion_group,
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "codecompanion" and vim.bo.buftype == "nofile" then
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
    end
  end,
})
