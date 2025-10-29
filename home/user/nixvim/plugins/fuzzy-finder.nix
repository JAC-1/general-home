{...}: {
  programs.nixvim.plugins = {
    # Fuzzy finder
    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        ui-select.enable = true;
      };
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Find files";
        };
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Live grep";
        };
        "<leader>fb" = {
          action = "buffers";
          options.desc = "Find buffers";
        };
        "<leader>fh" = {
          action = "help_tags";
          options.desc = "Help tags";
        };
        "<leader>fr" = {
          action = "oldfiles";
          options.desc = "Recent files";
        };
        "<leader>fw" = {
          action = "grep_string";
          options.desc = "Find word under cursor";
        };
        "<leader>fp" = {
          action = "projects";
          options.desc = "Find projects";
        };
      };
      settings = {
        defaults = {
          file_ignore_patterns = [
            "^.git/"
            "^node_modules/"
            "^target/"
            "^dist/"
            "^build/"
          ];
          mappings = {
            i = {
              "<C-j>" = {
                __raw = "require('telescope.actions').move_selection_next";
              };
              "<C-k>" = {
                __raw = "require('telescope.actions').move_selection_previous";
              };
            };
          };
        };
      };
    };

    # Trouble for diagnostics
    trouble = {
      enable = true;
    };
  };
}
