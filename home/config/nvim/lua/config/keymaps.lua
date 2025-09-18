-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.vscode then
  local function split(direction, file)
    if direction == "h" then
      vim.fn.VSCodeNotify("workbench.action.splitEditorDown")
    else
      vim.fn.VSCodeNotify("workbench.action.splitEditorRight")
    end
    if file and file ~= "" then
      vim.fn.VSCodeExtensionNotify("open-file", vim.fn.expand(file), "all")
    end
  end

  local function split_new(direction, file)
    split(direction, file == "" and "__vscode_new__" or file)
  end

  local function close_other_editors()
    vim.fn.VSCodeNotify("workbench.action.closeEditorsInOtherGroups")
    vim.fn.VSCodeNotify("workbench.action.closeOtherEditors")
  end

  local function manage_editor_size(count, to)
    for _ = 1, (count and count > 0) and count or 1 do
      vim.fn.VSCodeNotify(
        to == "increase" and "workbench.action.increaseViewSize" or "workbench.action.decreaseViewSize"
      )
    end
  end

  vim.api.nvim_create_user_command("Split", function(opts)
    split("h", opts.args)
  end, { nargs = "?" })

  vim.api.nvim_create_user_command("Vsplit", function(opts)
    split("v", opts.args)
  end, { nargs = "?" })

  vim.api.nvim_create_user_command("New", function()
    split("h", "__vscode_new__")
  end, { nargs = "?" })

  vim.api.nvim_create_user_command("Vnew", function()
    split("v", "__vscode_new__")
  end, { nargs = "?" })

  vim.api.nvim_create_user_command("Only", function(opts)
    if opts.bang then
      close_other_editors()
    else
      vim.fn.VSCodeNotify("workbench.action.joinAllGroups")
    end
  end, { bang = true })

  -- Keymaps
  vim.keymap.set({ "n", "x" }, "<C-w>s", function()
    split("h", "")
  end, { silent = true })
  vim.keymap.set({ "n", "x" }, "<C-w>v", function()
    split("v", "")
  end, { silent = true })
  vim.keymap.set({ "n", "x" }, "<C-w>n", function()
    split_new("h", "__vscode_new__")
  end, { silent = true })

  vim.keymap.set({ "n", "x" }, "<C-w>=", function()
    vim.fn.VSCodeNotify("workbench.action.evenEditorWidths")
  end, { silent = true })
  vim.keymap.set({ "n", "x" }, "<C-w>>", function()
    manage_editor_size(vim.v.count, "increase")
  end, { silent = true })
  vim.keymap.set({ "n", "x" }, "<C-w>+", function()
    manage_editor_size(vim.v.count, "increase")
  end, { silent = true })
  vim.keymap.set({ "n", "x" }, "<C-w><", function()
    manage_editor_size(vim.v.count, "decrease")
  end, { silent = true })
  vim.keymap.set({ "n", "x" }, "<C-w>-", function()
    manage_editor_size(vim.v.count, "decrease")
  end, { silent = true })

  -- Navigation
  vim.keymap.set({ "n", "x" }, "<C-j>", function()
    vim.fn.VSCodeNotify("workbench.action.navigateDown")
  end, { silent = true })
  vim.keymap.set({ "n", "x" }, "<C-k>", function()
    vim.fn.VSCodeNotify("workbench.action.navigateUp")
  end, { silent = true })
  vim.keymap.set({ "n", "x" }, "<C-h>", function()
    vim.fn.VSCodeNotify("workbench.action.navigateLeft")
  end, { silent = true })
  vim.keymap.set({ "n", "x" }, "<C-l>", function()
    vim.fn.VSCodeNotify("workbench.action.navigateRight")
  end, { silent = true })

  -- Commentary (requires a Comment function or plugin)
  vim.keymap.set({ "n", "x" }, "<C-/>", function()
    vim.cmd("call Comment()")
  end, { silent = true })

  vim.keymap.set("n", "<C-w>_", function()
    vim.fn.VSCodeNotify("workbench.action.toggleEditorWidths")
  end, { silent = true })

  -- WhichKey
  vim.keymap.set({ "n", "x" }, "<Space>", function()
    vim.fn.VSCodeNotify("whichkey.show")
  end, { silent = true })

  -- NerdTree
  vim.keymap.set({ "n", "x" }, "<Space>e", function()
    vim.fn.VSCodeNotify("whichkey.show")
  end, { silent = true })
else
  vim.keymap.set("i", "jj", "<ESC>", { silent = true })
  vim.keymap.set("n", ";", ":")

  -- Window Navigation
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

  -- Terminal
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
  vim.keymap.set("n", "<leader>ac", "<CMD>CodeCompanionChat Toggle<CR>", { desc = "CC Toggle", silent = true })
  vim.keymap.set("v", "<leader>ac", "<CMD>CodeCompanionChat Toggle<CR>", { desc = "CC Toggle", silent = true })
  vim.keymap.set("n", "<leader>an", "<CMD>CodeCompanionChat<CR>", { desc = "New CC Chat", silent = true })
  vim.keymap.set("v", "<leader>an", "<CMD>CodeCompanionChat<CR>", { desc = "New CC Chat", silent = true })
  vim.keymap.set("n", "<leader>aa", "<CMD>CodeCompanionActions<CR>", { desc = "CC Actions", silent = true })
  vim.keymap.set("v", "<leader>aa", "<CMD>CodeCompanionActions<CR>", { desc = "CC Actions", silent = true })
  vim.keymap.set("v", "<C-CR>", [[:CodeCompanion ]], { desc = "CodeCompanion Inline" })
end
