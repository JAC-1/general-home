# NixVim Configuration

A clean and productive Neovim configuration for TypeScript/JavaScript, Rust, and general development using NixVim.

## Features

### Language Support
- **TypeScript/JavaScript** - Full LSP, formatting (prettier), linting (eslint_d)
- **Rust** - rust-analyzer, rustfmt, clippy, rustaceanvim, crates.nvim
- **Markdown** - Marksman LSP, render-markdown for beautiful rendering
- **Nix** - nixd LSP, alejandra formatting
- **JSON/YAML** - SchemaStore integration for auto-completion

### Core Plugins
- **Treesitter** - Syntax highlighting and text objects
  - Text objects: `aa`/`ia` (argument), `af`/`if` (function), `aC`/`iC` (class)
- **LSP** - Native LSP with blink-cmp autocompletion
- **Telescope** - Fuzzy finder for files, grep, buffers, projects
- **Neo-tree** - File explorer
- **Oil.nvim** - Edit filesystem like a buffer
- **Harpoon** - Quick file navigation
- **Project.nvim** - Project management

### AI Integration
- **GitHub Copilot** - AI pair programming
- **Copilot Chat** - Interactive AI assistance
- **CodeCompanion** - Advanced AI chat and inline assistance

#### AI Keybindings
- `<leader>ac` - Open AI chat
- `<Ctrl-Enter>` - AI inline assistant
- `<leader>aa` - AI actions menu
- `<leader>at` - Toggle AI chat
- `<leader>ae` - AI explain code
- `<leader>af` - AI fix issues
- `<leader>ao` - AI optimize code
- `<leader>ad` - AI generate docs
- `<leader>ar` - AI review code

### Development Tools
- **DAP** - Debug Adapter Protocol for debugging
- **Git** - Gitsigns, LazyGit integration
- **Trouble** - Diagnostics and quickfix list
- **Undotree** - Visual undo history
- **Flash.nvim** - Enhanced navigation
- **Todo Comments** - Highlight and search TODO/FIXME/etc
- **Mini.hipatterns** - Highlight hex colors and patterns

### UI Enhancements
- **Gruvbox** - Color scheme
- **Lualine** - Status line
- **Noice** - Better UI for messages, cmdline, popover
- **Which-key** - Keybinding help
- **Indent-blankline** - Indent guides
- **Web-devicons** - File icons

## Installation

See [KEYBINDINGS.md](./KEYBINDINGS.md) for a complete keybinding reference.

### Home Manager

Add this to your `home.nix`:

```nix
{
  imports = [
    ./nixvim-config
  ];
}
```

Then rebuild:

```bash
home-manager switch
```

### Standalone NixOS

Add to your `configuration.nix`:

```nix
{
  imports = [
    /path/to/nixvim-config
  ];
}
```

## Keybindings

See [KEYBINDINGS.md](./KEYBINDINGS.md) for the complete keybinding reference.

## Customization

The config is modular and split into:
- `default.nix` - Main config with options and colorscheme
- `lsp.nix` - LSP servers, completion, formatting, linting
- `plugins/` - Plugin configurations organized by category
  - `treesitter.nix` - Syntax highlighting
  - `ui.nix` - UI enhancements
  - `editor.nix` - Editor plugins
  - `fuzzy-finder.nix` - Telescope
  - `git.nix` - Git integration
  - `ai.nix` - AI assistants
  - `dap.nix` - Debugging
  - `utils.nix` - Utility plugins and keymaps

## Requirements

The following packages should be available (usually provided by nixpkgs):
- Node.js (for TypeScript LSP)
- Rust toolchain (for rust-analyzer)
- Git
- Ripgrep (for Telescope grep)
- fd (for Telescope file finding)
- Lazygit (optional, for git TUI)

## Notes

- Auto-save is enabled on `InsertLeave` and `TextChanged`
- Format on save is enabled
- Git blame is shown inline by default
- Copilot requires authentication (`/Copilot auth` in Neovim)
