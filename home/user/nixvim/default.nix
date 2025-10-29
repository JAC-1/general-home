{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./plugins
    ./lsp.nix
  ];

  # Enable nixvim
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    # Clipboard settings
    clipboard.providers.wl-copy.enable = true;

    # Global options
    opts = {
      # Line numbers
      number = true;
      relativenumber = true;

      # Tabs and indentation
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      smartindent = true;

      # Search
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;

      # Appearance
      termguicolors = true;
      signcolumn = "yes";
      cursorline = true;
      scrolloff = 8;
      sidescrolloff = 8;

      # Behavior
      mouse = "a";
      undofile = true;
      swapfile = false;
      backup = false;
      splitright = true;
      splitbelow = true;
      wrap = false;

      # Performance
      updatetime = 250;
      timeoutlen = 300;

      # Completion
      completeopt = ["menu" "menuone" "noselect"];
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    # Colorscheme
    colorschemes.gruvbox = {
      enable = true;
      settings = {
        contrast_dark = "medium";
        transparent_mode = false;
      };
    };
  };
}
