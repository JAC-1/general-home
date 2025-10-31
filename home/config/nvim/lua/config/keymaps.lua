-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("n", ";", ":")

-- Window Navigation?

vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })

-- DAP
-- local dap = require("dap")
-- vim.keymap.set("n", "<leader>xb", function()
--   dap.toggle_breakpoint()
-- end)

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Send highlighted to hole and pastes registery." })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { silent = true, desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { silent = true, desc = "Yank entire line to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>dd", [["_d]], { desc = "Send to hole" })

vim.keymap.set(
  "n",
  "<C-s>",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Edit all words under cursor." }
)

--Harpoon
vim.keymap.set("n", "<leader>a", function()
  require("harpoon"):list():add()
end, { desc = "Poon File", silent = true })

--Terminal
vim.keymap.set("n", "<C-t>", "<CMD>ToggleTerm<CR>", { desc = "Toggle Terminal", silent = true })
vim.keymap.set("t", "<C-t>", "<CMD>ToggleTerm<CR>", { desc = "Toggle Terminal", silent = true })
vim.keymap.set("t", "<Esc><ESC>", "<C-\\><C-n>", { desc = "Escape Terminal", silent = true })

-- Telescope
vim.keymap.set("n", "<leader>sf", "<CMD>FzfLua files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<C-p>", "<CMD>FzfLua git_files<CR>", { desc = "Find Git Files" })
-- vim.keymap.set("n", "<leader>pws", function()
--   local word = vim.fn.expand("<cword>")
--   builtin.grep_string({ search = word })
-- end, { desc = "Grep Hovered Word" })
-- vim.keymap.set("n", "<leader>pWs", function()
--   local word = vim.fn.expand("<cWORD>")
--   builtin.grep_string({ search = word })
-- end)
-- vim.keymap.set("n", "<leader>ps", function()
--   builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end, { desc = "Grep" })
-- vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Seach Help Tags" })

-- Hover
vim.keymap.set("n", "<leader>k", require("hover").hover, { desc = "hover.nvim" })

-- Better Zen

-- CodeCompanion
vim.keymap.set("n", "<leader>ac", "<CMD>CodeCompanionChat<CR>", { desc = "CodeCompanion Chat", silent = true })
vim.keymap.set("v", "<leader>ac", "<CMD>CodeCompanionChat<CR>", { desc = "CodeCompanion Chat", silent = true })
vim.keymap.set("n", "<leader>aa", "<CMD>CodeCompanionActions<CR>", { desc = "CodeCompanion Actions", silent = true })
vim.keymap.set("v", "<leader>aa", "<CMD>CodeCompanionActions<CR>", { desc = "CodeCompanion Actions", silent = true })
vim.keymap.set("v", "<C-i>", [[:CodeCompanion ]], { desc = "CodeCompanion Inline" })
