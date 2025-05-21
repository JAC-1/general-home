return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type vim.diagnostic.Opts
      diagnostics = {
        virtual_text = true,
      },
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        rust_analyzer = {},
        tsserver = {},
        pyright = {},
      },
      inlay_hints = {
        enabled = false,
      },
      document_highlight = {
        enabled = false,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    highlight = {
      enable = false,
    },
  },
}
