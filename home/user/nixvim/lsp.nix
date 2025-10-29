{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      # LSP Configuration
      lsp = {
        enable = true;
        servers = {
          # TypeScript/JavaScript
          ts_ls = {
            enable = true;
            filetypes = ["javascript" "javascriptreact" "typescript" "typescriptreact"];
          };

          # Rust
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
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

          # JSON
          jsonls = {
            enable = true;
            settings = {
              json = {
                schemas = {
                  __raw = "require('schemastore').json.schemas()";
                };
                validate.enable = true;
              };
            };
          };

          # HTML/CSS
          html = {enable = true;};
          cssls = {enable = true;};
          tailwindcss = {enable = true;};

          # Markdown
          marksman = {enable = true;};

          # Nix
          nixd = {enable = true;};

          # YAML
          yamlls = {
            enable = true;
            settings = {
              yaml = {
                schemaStore = {
                  enable = false;
                };
                schemas = {
                  __raw = "require('schemastore').yaml.schemas()";
                };
              };
            };
          };

          # Lua (for neovim config)
          lua_ls = {
            enable = true;
            settings.telemetry.enable = false;
          };
        };

        keymaps = {
          silent = true;
          diagnostic = {
            "[d" = "goto_prev";
            "]d" = "goto_next";
            "<leader>e" = "open_float";
            "<leader>q" = "setloclist";
            "gl" = "open_float"; # Easy diagnostic popup like VSCode hover
          };
          lspBuf = {
            "gd" = "definition";
            "gD" = "declaration";
            "gr" = "references";
            "gi" = "implementation";
            "K" = "hover";
            "<C-k>" = "signature_help";
            "<leader>ca" = "code_action";
            "<leader>rn" = "rename";
            "<leader>D" = "type_definition";
            "<leader>wa" = "add_workspace_folder";
            "<leader>wr" = "remove_workspace_folder";
          };
        };
      };

      # Autocompletion
      blink-cmp = {
        enable = true;
        settings = {
          keymap = {
            preset = "default";
            "<C-space>" = ["show" "show_documentation" "hide_documentation"];
            "<C-e>" = ["hide"];
            "<CR>" = ["accept" "fallback"];
            "<Tab>" = ["select_next" "fallback"];
            "<S-Tab>" = ["select_prev" "fallback"];
            "<C-b>" = ["scroll_documentation_up" "fallback"];
            "<C-f>" = ["scroll_documentation_down" "fallback"];
          };
          appearance = {
            use_nvim_cmp_as_default = true;
            nerd_font_variant = "mono";
          };
          sources = {
            default = ["lsp" "path" "snippets" "buffer"];
          };
          completion = {
            documentation = {
              auto_show = true;
              auto_show_delay_ms = 500;
            };
            menu = {
              draw = {
                treesitter = ["lsp"];
              };
            };
          };
        };
      };

      # Snippets
      friendly-snippets.enable = true;

      # Formatting
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            javascript = ["prettier"];
            typescript = ["prettier"];
            javascriptreact = ["prettier"];
            typescriptreact = ["prettier"];
            json = ["prettier"];
            html = ["prettier"];
            css = ["prettier"];
            markdown = ["prettier"];
            yaml = ["prettier"];
            rust = ["rustfmt"];
            nix = ["alejandra"];
          };
          format_on_save = {
            lsp_format = "fallback";
            timeout_ms = 500;
          };
        };
      };

      # Linting
      lint = {
        enable = true;
        lintersByFt = {
          typescript = ["eslint_d"];
          javascript = ["eslint_d"];
          typescriptreact = ["eslint_d"];
          javascriptreact = ["eslint_d"];
        };
      };
    };
  };
}
