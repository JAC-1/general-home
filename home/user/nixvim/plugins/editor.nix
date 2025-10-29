{...}: {
  programs.nixvim.plugins = {
    # File explorer
    neo-tree = {
      enable = true;
      closeIfLastWindow = true;
      window = {
        width = 30;
        autoExpandWidth = false;
      };
    };

    # Oil - Edit filesystem like a buffer
    oil = {
      enable = true;
      settings = {
        view_options = {
          show_hidden = true;
        };
        keymaps = {
          "g?" = "actions.show_help";
          "<CR>" = "actions.select";
          "-" = "actions.parent";
          "_" = "actions.open_cwd";
          "g." = "actions.toggle_hidden";
        };
      };
    };

    # Undo tree
    undotree = {
      enable = true;
      settings = {
        FocusOnToggle = true;
        ShortIndicators = true;
      };
    };

    # Comment plugin
    comment = {
      enable = true;
    };

    # Auto-save TODO: Fix
    # auto-save = {
    #   enable = true;
    #   settings = {
    #     enabled = true;
    #     trigger_events = ["InsertLeave" "TextChanged"];
    #   };
    # };

    # Project management
    project-nvim = {
      enable = true;
      enableTelescope = true;
    };

    # Harpoon for quick file navigation
    harpoon = {
      enable = true;
      enableTelescope = true;
      keymaps = {
        addFile = "<leader>ha";
        toggleQuickMenu = "<leader>hh";
        navFile = {
          "1" = "<leader>1";
          "2" = "<leader>2";
          "3" = "<leader>3";
          "4" = "<leader>4";
          "5" = "<leader>5";
          "6" = "<leader>6";
          "7" = "<leader>7";
          "8" = "<leader>8";
          "9" = "<leader>9";
        };
        navNext = "<leader>hn";
        navPrev = "<leader>hp";
      };
    };
  };
}
