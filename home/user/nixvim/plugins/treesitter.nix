{ pkgs, config, ... }:

{
  programs.nixvim = {
    plugins = {
      # Tree-sitter core
      treesitter = {
        enable = true;
        nixGrammars = false;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          c
          lua
          markdown
          markdown_inline
          nix
          python
          vim
          vimdoc
          json
          yaml
          html
          css
          javascript
          typescript
          rust
        ];
        settings = {
          highlight.enable = true;
          indent.enable = true;
          incremental_selection.enable = true;
        };
      };

      # Tree-sitter Text-Objects (disabled due to query errors)
      # treesitter-textobjects = {
      #   enable = true;
      #   select = {
      #     enable = true;
      #     lookahead = true;
      #     keymaps = {
      #       "aa" = "@parameter.outer";
      #       "ia" = "@parameter.inner";
      #       "af" = "@function.outer";
      #     };
      #   };
      #   move = {
      #     enable = true;
      #   };
      # };
    };
  };

  # Extra packages you might need at runtime (e.g. gcc for building)
  programs.nixvim.extraPackages = with pkgs; [ gcc ];
}
