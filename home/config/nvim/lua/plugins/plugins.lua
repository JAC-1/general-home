return {
  -- Undo Tree
  "mbbill/undotree",

  -- Maybe some old ass p5js work around
  { "heittpr/p5.vim" },
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = true,
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },

  --Diabled
  { "akinsho/bufferline.nvim", enabled = false },
  { "iamcco/markdown-preview.nvim", enabled = false },
  { "RRethy/vim-illuminate", enabled = false },
  -- { "saghen/blink.cmp", enable = false },
  --diable flash.nvim
  { "danilamihailov/beacon.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  --disable treesitter, nvim-tressitter-textobjects, and cmp
}
