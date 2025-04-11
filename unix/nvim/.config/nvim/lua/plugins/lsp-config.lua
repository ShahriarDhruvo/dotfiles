-- return {
-- 	{
-- 		"folke/lazydev.nvim",
-- 		ft = "lua",
-- 		opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
-- 	},
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		dependencies = {
-- 			{
-- 				"williamboman/mason.nvim",
-- 				lazy = false,
-- 				config = function()
-- 					require("mason").setup()
-- 				end,
-- 			},
-- 			{
-- 				"williamboman/mason-lspconfig.nvim",
-- 				lazy = false,
-- 				opts = { auto_install = true },
-- 			},
-- 			{ "j-hui/fidget.nvim", opts = {} },
-- 			"WhoIsSethDaniel/mason-tool-installer.nvim",
-- 			"hrsh7th/cmp-nvim-lsp",
-- 		},
-- 		lazy = false,
-- 		config = function()
-- 			local capabilities = require("blink.cmp").get_lsp_capabilities()
-- 			local lspconfig = require("lspconfig")

-- 			lspconfig.pyright.setup({ capabilities = capabilities })
-- 			lspconfig.ts_ls.setup({ capabilities = capabilities })
-- 			-- lspconfig.gopls.setup({ capabilities = capabilities })
-- 			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
-- 			lspconfig.clangd.setup({ capabilities = capabilities })
-- 			lspconfig.jsonls.setup({ capabilities = capabilities })
-- 			lspconfig.lua_ls.setup({ capabilities = capabilities })
-- 			lspconfig.tailwindcss.setup({ capabilities = capabilities })
-- 			lspconfig.dockerls.setup({ capabilities = capabilities })
-- 			lspconfig.marksman.setup({ capabilities = capabilities })
-- 			lspconfig.intelephense.setup({ capabilities = capabilities })

-- 			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- 			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
-- 			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
-- 			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
-- 		end,
-- 	},
-- }

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Open Mason" } },
        build = ":MasonUpdate",
        opts = {
          ensure_installed = {
            "stylua",
            "shfmt",
            "flake8",
            "black",
            "isort",
            "prettier",
            "eslint_d",
            "codespell",
            "clang-format",
          },
        },
        config = function(_, opts)
          require("mason").setup(opts)
          local mr = require("mason-registry")
          for _, tool in ipairs(opts.ensure_installed) do
            local p = mr.get_package(tool)
            if not p:is_installed() then
              p:install()
            end
          end
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            "lua_ls",
            "pyright",
            "ts_ls",
            "rust_analyzer",
            "clangd",
            "jsonls",
            "tailwindcss",
            "dockerls",
            "marksman",
            "intelephense",
          },
          automatic_installation = true,
        },
      },
      "hrsh7th/cmp-nvim-lsp",
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      local servers = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "rust_analyzer",
        "clangd",
        "jsonls",
        "tailwindcss",
        "dockerls",
        "marksman",
        "intelephense"
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end

      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to References" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
    end,
  },
}