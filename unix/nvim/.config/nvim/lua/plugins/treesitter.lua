-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	build = ":TSUpdate",
-- 	config = function()
-- 		local configs = require("nvim-treesitter.configs")
-- 		configs.setup({
-- 			auto_install = true,
-- 			sync_install = false,
-- 			highlight = { enable = true },
-- 			indent = { enable = true },
-- 		})
-- 	end,
-- }

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      ensure_installed = {
        "bash", "c", "html", "javascript", "json", "lua", "luadoc",
        "luap", "markdown", "markdown_inline", "python", "query", 
        "regex", "tsx", "typescript", "vim", "yaml", "ruby"
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        enable = true,
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    },
  },
}