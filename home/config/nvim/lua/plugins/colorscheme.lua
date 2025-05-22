return {
  -- { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
  -- { "ntk148v/komau.vim" },
  -- {
  --   "slugbyte/lackluster.nvim",
  --   lazy = false,
  --   priority = 1000,
  -- },
  -- {
  --   "navarasu/onedark.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("onedark").setup({
  --       style = "dark",
  --     })
  --   end,
  -- },
  -- {
  --   "neanias/everforest-nvim",
  --   version = false,
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   -- Optional; default configuration will be used if setup isn't called.
  --   config = function()
  --     require("everforest").setup({
  --       -- Your config here
  --     })
  --   end,
  -- },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
