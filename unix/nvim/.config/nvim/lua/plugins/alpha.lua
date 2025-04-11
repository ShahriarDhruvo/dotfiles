return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "folke/persistence.nvim",
      lazy = false,
    },
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("s", "  Restore Session", [[:lua require("persistence").load() <cr>]]),
      dashboard.button("l", "  Lazy", ":Lazy<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    dashboard.config.layout = {
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 2 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.opts)

    -- Auto start alpha when no files are specified
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
