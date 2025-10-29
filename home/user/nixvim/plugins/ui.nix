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
        spec = [
          {
            __unkeyed-1 = "<leader>a";
            group = "AI";
          }
          {
            __unkeyed-1 = "<leader>b";
            group = "Buffer";
          }
          {
            __unkeyed-1 = "<leader>c";
            group = "Code";
          }
          {
            __unkeyed-1 = "<leader>d";
            group = "Debug";
          }
          {
            __unkeyed-1 = "<leader>h";
            group = "Harpoon";
          }
          {
            __unkeyed-1 = "<leader>q";
            group = "Quit";
          }
          {
            __unkeyed-1 = "<leader>r";
            group = "Rename";
          }
          {
            __unkeyed-1 = "<leader>s";
            group = "Search";
          }
          {
            __unkeyed-1 = "<leader>ha";
            desc = "Add file";
          }
          {
            __unkeyed-1 = "<leader>hh";
            desc = "Quick menu";
          }
          {
            __unkeyed-1 = "<leader>hn";
            desc = "Next file";
          }
          {
            __unkeyed-1 = "<leader>hp";
            desc = "Previous file";
          }
          {
            __unkeyed-1 = "<leader>1";
            desc = "Harpoon file 1";
          }
          {
            __unkeyed-1 = "<leader>2";
            desc = "Harpoon file 2";
          }
          {
            __unkeyed-1 = "<leader>3";
            desc = "Harpoon file 3";
          }
          {
            __unkeyed-1 = "<leader>4";
            desc = "Harpoon file 4";
          }
          {
            __unkeyed-1 = "<leader>5";
            desc = "Harpoon file 5";
          }
          {
            __unkeyed-1 = "<leader>6";
            desc = "Harpoon file 6";
          }
          {
            __unkeyed-1 = "<leader>7";
            desc = "Harpoon file 7";
          }
          {
            __unkeyed-1 = "<leader>8";
            desc = "Harpoon file 8";
          }
          {
            __unkeyed-1 = "<leader>9";
            desc = "Harpoon file 9";
          }
          {
            __unkeyed-1 = "<leader>g";
            desc = "Git";
          }
        ];
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
