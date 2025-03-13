return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"ts_ls",
					-- "gopls",
					"rust_analyzer",
					"clangd",
					"jsonls",
					"lua_ls",
					"tailwindcss",
					"dockerls",
					"marksman",
					"intelephense",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.pyright.setup({})
			lspconfig.ts_ls.setup({})
			-- lspconfig.gopls.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.clangd.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.dockerls.setup({})
			lspconfig.marksman.setup({})
			lspconfig.intelephense.setup({})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
