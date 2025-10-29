{pkgs, ...}: {
  programs.nixvim.plugins = {
    # Treesitter for syntax highlighting
    treesitter = {
      enable = true;
      nixGrammars = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        c
        css
        diff
        html
        javascript
        jsdoc
        json
        lua
        luadoc
        markdown
        markdown_inline
        nix
        python
        regex
        rust
        toml
        tsx
        typescript
        vim
        vimdoc
        xml
        yaml
      ];
      settings = {
        highlight.enable = true;
        indent.enable = true;
        incremental_selection.enable = true;
        auto_install = false;
        sync_install = false;
        ensure_installed = [];

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

    # Auto tag for HTML/JSX (disabled for debugging)
    # ts-autotag.enable = true;

    # Better comments (disabled for debugging)
    # ts-comments.enable = true;
  };


}
