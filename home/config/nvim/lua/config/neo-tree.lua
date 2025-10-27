return {
  function()
    local neotree = require("neotree")
    neotree.setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    })
  end,
}
