{...}: {
  programs.nixvim.plugins = {
    # Status line
    lualine = {
      enable = true;
      settings = {
        options = {
          icons_enabled = true;
          theme = "gruvbox";
          component_separators = {
            left = "|";
            right = "|";
          };
          section_separators = {
            left = "";
            right = "";
          };
        };
        sections = {
          lualine_a = ["mode"];
          lualine_b = ["branch" "diff" "diagnostics"];
          lualine_c = ["filename"];
          lualine_x = ["encoding" "fileformat" "filetype"];
          lualine_y = ["progress"];
          lualine_z = ["location"];
        };
      };
    };

    # Icons
    web-devicons.enable = true;

    # Notifications and UI enhancements
    noice = {
      enable = true;
      settings = {
        lsp = {
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
        };
        presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
          inc_rename = false;
          lsp_doc_border = false;
        };
      };
    };

    # Notification manager
    notify = {
      enable = true;
      backgroundColour = "#000000";
      fps = 60;
      timeout = 3000;
    };

    # Which-key for keybinding help
    which-key = {
      enable = true;
      settings = {
        delay = 500;
        icons = {
          breadcrumb = "»";
          separator = "➜";
          group = "+";
        };
      };
    };

    # Indent guides
    indent-blankline = {
      enable = true;
      settings = {
        indent = {
          char = "│";
        };
        scope = {
          enabled = true;
          show_start = true;
          show_end = false;
        };
      };
    };
  };
}
