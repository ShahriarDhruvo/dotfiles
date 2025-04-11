return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 600,
      lsp_fallback = true,
    },
  },
}

