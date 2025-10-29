{pkgs, ...}: {
  programs.nixvim = {
    # GitHub Copilot
    plugins.copilot-lua = {
      enable = true;
      suggestion = {
        enabled = true;
        autoTrigger = true;
        keymap = {
          accept = "<M-l>";
          acceptWord = "<M-w>";
          acceptLine = "<M-j>";
          next = "<M-]>";
          prev = "<M-[>";
          dismiss = "<C-]>";
        };
      };
      panel.enabled = false;
      filetypes = {
        yaml = true;
        markdown = true;
        help = false;
        gitcommit = true;
        gitrebase = false;
        hgcommit = false;
        svn = false;
        cvs = false;
        "." = false;
      };
    };

    # Copilot Chat
    plugins.copilot-chat = {
      enable = true;
    };

    # CodeCompanion for AI assistance
    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = codecompanion-nvim;
        config = ''
          lua << EOF
          require("codecompanion").setup({
            strategies = {
              chat = {
                adapter = "copilot",
              },
              inline = {
                adapter = "copilot",
              },
            },
            adapters = {
              copilot = function()
                return require("codecompanion.adapters").extend("copilot", {
                  schema = {
                    model = {
                      default = "claude-3.5-sonnet",
                    },
                  },
                })
              end,
            },
          })
          EOF
        '';
      }
    ];

    keymaps = [
      # CodeCompanion chat
      {
        mode = "n";
        key = "<leader>ac";
        action = "<cmd>CodeCompanionChat<cr>";
        options.desc = "AI Chat";
      }
      {
        mode = "v";
        key = "<leader>ac";
        action = "<cmd>CodeCompanionChat<cr>";
        options.desc = "AI Chat";
      }
      
      # CodeCompanion inline
      {
        mode = ["n" "v"];
        key = "<C-CR>";
        action = "<cmd>CodeCompanion<cr>";
        options.desc = "AI Inline";
      }
      
      # Additional AI commands
      {
        mode = "n";
        key = "<leader>aa";
        action = "<cmd>CodeCompanionActions<cr>";
        options.desc = "AI Actions";
      }
      {
        mode = "v";
        key = "<leader>aa";
        action = "<cmd>CodeCompanionActions<cr>";
        options.desc = "AI Actions";
      }
      {
        mode = "n";
        key = "<leader>at";
        action = "<cmd>CodeCompanionChat Toggle<cr>";
        options.desc = "Toggle AI Chat";
      }
      
      # Copilot Chat shortcuts
      {
        mode = "n";
        key = "<leader>ae";
        action = "<cmd>CopilotChatExplain<cr>";
        options.desc = "AI Explain";
      }
      {
        mode = "v";
        key = "<leader>ae";
        action = "<cmd>CopilotChatExplain<cr>";
        options.desc = "AI Explain";
      }
      {
        mode = "n";
        key = "<leader>af";
        action = "<cmd>CopilotChatFix<cr>";
        options.desc = "AI Fix";
      }
      {
        mode = "v";
        key = "<leader>af";
        action = "<cmd>CopilotChatFix<cr>";
        options.desc = "AI Fix";
      }
      {
        mode = "n";
        key = "<leader>ao";
        action = "<cmd>CopilotChatOptimize<cr>";
        options.desc = "AI Optimize";
      }
      {
        mode = "v";
        key = "<leader>ao";
        action = "<cmd>CopilotChatOptimize<cr>";
        options.desc = "AI Optimize";
      }
      {
        mode = "n";
        key = "<leader>ad";
        action = "<cmd>CopilotChatDocs<cr>";
        options.desc = "AI Docs";
      }
      {
        mode = "v";
        key = "<leader>ad";
        action = "<cmd>CopilotChatDocs<cr>";
        options.desc = "AI Docs";
      }
      {
        mode = "n";
        key = "<leader>ar";
        action = "<cmd>CopilotChatReview<cr>";
        options.desc = "AI Review";
      }
      {
        mode = "v";
        key = "<leader>ar";
        action = "<cmd>CopilotChatReview<cr>";
        options.desc = "AI Review";
      }
    ];
  };
}
