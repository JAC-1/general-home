{...}: {
  programs.nixvim.plugins = {
    # Markdown rendering
    render-markdown = {
      enable = true;
      settings = {
        file_types = ["markdown" "codecompanion"];
      };
    };

    # Plenary (required by many plugins)
    plenary.enable = true;

    # Flash for enhanced navigation
    flash = {
      enable = true;
      settings = {
        labels = "asdfghjklqwertyuiopzxcvbnm";
        search = {
          multi_window = true;
          forward = true;
          wrap = true;
        };
        jump = {
          autojump = false;
        };
        label = {
          uppercase = false;
        };
        modes = {
          char = {
            enabled = true;
            # Don't hide text during f/F/t/T motions
            highlight = {
              backdrop = false;
            };
          };
        };
      };
    };

    # Mini modules (ai, surround, pairs, hipatterns)
    mini = {
      enable = true;
      mockDevIcons = true;
      modules = {
        ai = {
          n_lines = 500;
        };
        surround = {};
        pairs = {};
        hipatterns = {
          highlighters = {
            fixme = {
              pattern = "%f[%w]()FIXME()%f[%W]";
              group = "MiniHipatternsFixme";
            };
            hack = {
              pattern = "%f[%w]()HACK()%f[%W]";
              group = "MiniHipatternsHack";
            };
            todo = {
              pattern = "%f[%w]()TODO()%f[%W]";
              group = "MiniHipatternsTodo";
            };
            note = {
              pattern = "%f[%w]()NOTE()%f[%W]";
              group = "MiniHipatternsNote";
            };
            hex_color = {
              __raw = "require('mini.hipatterns').gen_highlighter.hex_color()";
            };
          };
        };
      };
    };

    # Better search and replace
    grug-far = {
      enable = true;
    };

    # Snippet engine
    luasnip = {
      enable = true;
      fromVscode = [
        {
          paths = ./.; # Load friendly-snippets
        }
      ];
    };

    # Rust-specific tools
    rustaceanvim = {
      enable = true;
      settings = {
        server = {
          default_settings = {
            rust-analyzer = {
              cargo.allFeatures = true;
              check.command = "clippy";
              inlayHints.lifetimeElisionHints.enable = "always";
            };
          };
        };
      };
    };

    # Crates.nvim for Rust dependencies
    crates-nvim = {
      enable = true;
    };

    # SchemaStore for JSON schemas
    schemastore = {
      enable = true;
      json.enable = true;
      yaml.enable = true;
    };

    # Session management
    persistence = {
      enable = true;
    };

    # Todo comments
    todo-comments = {
      enable = true;
      settings = {
        signs = true;
      };
    };
  };

  programs.nixvim.keymaps = [
    # Oil file explorer
    {
      mode = "n";
      key = "-";
      action = "<cmd>Oil<cr>";
      options.desc = "Open parent directory";
    }

    # Flash navigation
    {
      mode = ["n" "x" "o"];
      key = "s";
      action = "<cmd>lua require('flash').jump()<cr>";
      options.desc = "Flash jump";
    }
    {
      mode = ["n" "x" "o"];
      key = "S";
      action = "<cmd>lua require('flash').treesitter()<cr>";
      options.desc = "Flash treesitter";
    }

    # Buffer navigation
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
      options.desc = "Previous buffer";
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
      options.desc = "Next buffer";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options.desc = "Delete buffer";
    }

    # Window navigation
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Go to left window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Go to lower window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Go to upper window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Go to right window";
    }

    # Resize windows
    {
      mode = "n";
      key = "<C-Up>";
      action = "<cmd>resize +2<cr>";
      options.desc = "Increase window height";
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = "<cmd>resize -2<cr>";
      options.desc = "Decrease window height";
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = "<cmd>vertical resize -2<cr>";
      options.desc = "Decrease window width";
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = "<cmd>vertical resize +2<cr>";
      options.desc = "Increase window width";
    }

    # Clear search highlighting
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<cr>";
      options.desc = "Clear search highlighting";
    }

    # Save file
    {
      mode = "n";
      key = "<leader>w";
      action = "<cmd>w<cr>";
      options.desc = "Save file";
    }

    # Quit
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>qa<cr>";
      options.desc = "Quit all";
    }

    # Neo-tree
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options.desc = "Toggle file explorer";
    }

    # Undotree
    {
      mode = "n";
      key = "<leader>u";
      action = "<cmd>UndotreeToggle<cr>";
      options.desc = "Toggle undo tree";
    }

    # Trouble
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options.desc = "Toggle diagnostics";
    }
    {
      mode = "n";
      key = "<leader>xd";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      options.desc = "Document diagnostics";
    }

    # Search and replace
    {
      mode = "n";
      key = "<leader>sr";
      action = "<cmd>GrugFar<cr>";
      options.desc = "Search and replace";
    }

    # Todo comments
    {
      mode = "n";
      key = "<leader>st";
      action = "<cmd>TodoTelescope<cr>";
      options.desc = "Find todos";
    }

    # Better indenting
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
    }

    # Move lines
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<cr>gv=gv";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<cr>gv=gv";
    }
  ];
}
