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
        "<leader>sf" = {
          action = "find_files";
          options.desc = "Find files";
        };
        "<leader>sg" = {
          action = "live_grep";
          options.desc = "Live grep";
        };
        "<leader>sb" = {
          action = "buffers";
          options.desc = "Find buffers";
        };
        "<leader>sh" = {
          action = "help_tags";
          options.desc = "Help tags";
        };
        "<leader>sr" = {
          action = "oldfiles";
          options.desc = "Recent files";
        };
        "<leader>sw" = {
          action = "grep_string";
          options.desc = "Find word under cursor";
        };
        "<leader>sp" = {
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
