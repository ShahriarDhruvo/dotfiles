return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

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
                require("none-ls.diagnostics.eslint"), -- JavaScript, TypeScript
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
