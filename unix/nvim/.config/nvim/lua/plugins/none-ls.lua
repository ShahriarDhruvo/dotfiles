return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"williamboman/mason.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		-- Ensure mason binaries are in path
    local mason_bin = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/bin/")
    vim.env.PATH = mason_bin .. ":" .. vim.env.PATH

		null_ls.setup({
			sources = {
				-- Formatters
				null_ls.builtins.formatting.stylua, -- Lua
				null_ls.builtins.formatting.prettier, -- JavaScript, TypeScript, JSON, CSS, HTML, etc.
				null_ls.builtins.formatting.black, -- Python
				null_ls.builtins.formatting.isort, -- Python
				null_ls.builtins.formatting.clang_format, -- C++

				-- Completion
				null_ls.builtins.completion.spell, -- Spell checking completions

				-- Diagnostics
				null_ls.builtins.diagnostics.codespell, -- spell checking across many file types.
				-- require("none-ls.diagnostics.eslint"), -- JavaScript, TypeScript
				null_ls.builtins.diagnostics.eslint_d, -- JavaScript, TypeScript
				null_ls.builtins.diagnostics.flake8, -- Python
				null_ls.builtins.diagnostics.mypy, -- Python
				null_ls.builtins.diagnostics.shellcheck, -- Shell scripts
				null_ls.builtins.diagnostics.write_good, -- English grammar
			},
		})

		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format code" })
	end,
}