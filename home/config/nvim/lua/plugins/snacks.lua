return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    ---@type snacks.Config
    opts = {
      -- disable smooth scroll
      scroll = { enabled = false },
      keys = {
        {
          "<leader>uz",
          function()
            Snacks.zen()
            Snacks.zen.zoom()
          end,
          desc = "Toggle Zen Mode",
        },
      },
      ---@class snacks.zen.Config
      zen = {
        toggles = {
          diagnostics = false,
          inlay_hints = false,
        },
      },
      ---@type table<string, snacks.win.Config>
      styles = {
        zen = {
          minimal = true,
          backdrop = { transparent = false, blend = 99 },
          width = 90,
        },
      },
    },
  },
}
