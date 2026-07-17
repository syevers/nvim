return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      signature = {
        auto_open = {
          enabled = true,
          trigger = true,
          luasnip = true,
          throttle = 120,
        },
        opts = {
          size = {
            max_width = 84,
            max_height = 12,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            wrap = true,
            linebreak = true,
          },
        },
      },
      hover = {
        opts = {
          size = {
            max_width = 88,
            max_height = 16,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            wrap = true,
            linebreak = true,
          },
        },
      },
    },
    presets = {
      lsp_doc_border = true,
    },
  },
}

