return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  opts = {
    is_insert_mode = true,
    is_block_mode = true,
    live_update = true,
    find_engine = {
      ['rg'] = {
        cmd = "rg",
        args = {
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--hidden',
          '--glob=!.git',
          '-H'
        },
        options = {
          ['ignore-case'] = {
            value = "--ignore-case",
            icon = "[I]",
            desc = "ignore case"
          },
          ['hidden'] = {
            value = "--hidden",
            desc = "hidden files"
          }
        }
      }
    }
  },
  keys = {
    { "<leader>S", '<cmd>Spectre<CR>', desc = "Open Spectre" },
  },
}