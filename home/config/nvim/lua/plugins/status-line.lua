return {
  "nvim-lua/lsp-status.nvim",
  config = function()
    require("lsp-status").config({
      status_symbol = "LSP",
      indicator_errors = "E",
      indicator_warnings = "W",
      indicator_info = "I",
      indicator_hint = "H",
    })
  end,
}
