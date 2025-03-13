return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            window = {
                position = "right",
                width = 25,
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        })

        -- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>", { desc = "Open neotree at the right" })
        vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { desc = "Toggle neotree" })
    end
}

