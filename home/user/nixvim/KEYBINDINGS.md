# Keybindings Reference

Leader key: `<Space>`

## General
- `<leader>w` - Save file
- `<leader>qq` - Quit all
- `<Esc>` - Clear search highlighting
- `gl` - Show diagnostic popup (like VSCode hover)

## Navigation
- `<C-h/j/k/l>` - Navigate windows
- `<S-h/l>` - Previous/next buffer
- `<leader>bd` - Delete buffer
- `-` - Open parent directory in Oil
- `s` - Flash jump
- `S` - Flash treesitter

## File Explorer
- `<leader>e` - Toggle Neo-tree
- `<leader>u` - Toggle Undotree

## Fuzzy Finding (Telescope)
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fh` - Help tags
- `<leader>fr` - Recent files
- `<leader>fw` - Find word under cursor
- `<leader>fp` - Find projects
- `<leader>st` - Find todos

## Harpoon
- `<leader>ha` - Add file to harpoon
- `<leader>hh` - Toggle harpoon menu
- `<leader>1-9` - Jump to harpoon file 1-9
- `<leader>hn/hp` - Next/previous harpoon file

## LSP
- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Go to references
- `gi` - Go to implementation
- `K` - Hover documentation
- `<C-k>` - Signature help
- `<leader>ca` - Code action
- `<leader>rn` - Rename
- `[d/]d` - Previous/next diagnostic

## Text Objects (Treesitter)
- `aa`/`ia` - Around/inside argument
- `af`/`if` - Around/inside function
- `aC`/`iC` - Around/inside class
- `]f`/`[f` - Next/previous function
- `]c`/`[c` - Next/previous class

## AI Assistant
- `<leader>ac` - Open AI chat
- `<Ctrl-Enter>` - AI inline assistant
- `<leader>aa` - AI actions menu
- `<leader>at` - Toggle AI chat
- `<leader>ae` - AI explain code
- `<leader>af` - AI fix issues
- `<leader>ao` - AI optimize code
- `<leader>ad` - AI generate docs
- `<leader>ar` - AI review code

### Copilot Suggestions
- `<M-l>` - Accept suggestion
- `<M-w>` - Accept word
- `<M-j>` - Accept line
- `<M-]>`/`<M-[>` - Next/previous suggestion
- `<C-]>` - Dismiss suggestion

## Debugging (DAP)
- `<leader>db` - Toggle breakpoint
- `<leader>dc` - Continue
- `<leader>di` - Step into
- `<leader>do` - Step over
- `<leader>dO` - Step out
- `<leader>dt` - Terminate
- `<leader>du` - Toggle DAP UI
- `<leader>dr` - Toggle REPL

## Git
- `<leader>gg` - LazyGit
- `<leader>gb` - Git blame line
- `<leader>gp` - Preview hunk
- `<leader>gr` - Reset hunk
- `[h/]h` - Previous/next hunk

## Diagnostics
- `<leader>xx` - Toggle diagnostics
- `<leader>xd` - Document diagnostics
- `gl` - Show diagnostic float

## Search & Replace
- `<leader>sr` - Search and replace (GrugFar)

## Window Management
- `<C-Up>` - Increase window height
- `<C-Down>` - Decrease window height
- `<C-Left>` - Decrease window width
- `<C-Right>` - Increase window width

## Editing
- `<` / `>` (visual) - Decrease/increase indent (stays in visual mode)
- `J` / `K` (visual) - Move selected lines down/up
