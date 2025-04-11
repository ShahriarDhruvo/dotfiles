return {
  "folke/snacks.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
          layout = {
            layout = {
              position = "left",
              width = 0.20,
            },
          },
        },
      },
    },
  },
  keys = { {
    "-",
    function()
      Snacks.explorer()
    end,
    desc = "File Explorer",
  } },
}
