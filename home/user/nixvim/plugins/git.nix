{...}: {
  programs.nixvim.plugins = {
    # Git signs
    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add.text = "│";
          change.text = "│";
          delete.text = "_";
          topdelete.text = "‾";
          changedelete.text = "~";
          untracked.text = "┆";
        };
        current_line_blame = true;
        current_line_blame_opts = {
          virt_text = true;
          virt_text_pos = "eol";
        };
      };
    };

    # Lazygit integration
    lazygit = {
      enable = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<cr>";
      options.desc = "LazyGit";
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Gitsigns blame_line<cr>";
      options.desc = "Git blame line";
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = "<cmd>Gitsigns preview_hunk<cr>";
      options.desc = "Preview hunk";
    }
    {
      mode = "n";
      key = "<leader>gr";
      action = "<cmd>Gitsigns reset_hunk<cr>";
      options.desc = "Reset hunk";
    }
    {
      mode = "n";
      key = "]h";
      action = "<cmd>Gitsigns next_hunk<cr>";
      options.desc = "Next hunk";
    }
    {
      mode = "n";
      key = "[h";
      action = "<cmd>Gitsigns prev_hunk<cr>";
      options.desc = "Previous hunk";
    }
  ];
}
