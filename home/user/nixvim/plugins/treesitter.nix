{...}: {
  programs.nixvim.plugins = {
    # Treesitter for syntax highlighting
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        incremental_selection.enable = true;
      };
    };

    # Treesitter text objects
    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "af" = "@function.outer";
          "if" = "@function.inner";
          "aC" = "@class.outer";
          "iC" = "@class.inner";
        };
      };
      move = {
        enable = true;
        gotoNextStart = {
          "]f" = "@function.outer";
          "]c" = "@class.outer";
        };
        gotoPreviousStart = {
          "[f" = "@function.outer";
          "[c" = "@class.outer";
        };
      };
    };

    # Auto tag for HTML/JSX
    ts-autotag.enable = true;

    # Better comments
    ts-comments.enable = true;
  };
}
