return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = true },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},

		config = function()
			-- Define telescope_with_hidden_no_git function
			local function telescope_with_hidden_no_git(builtin_name, opts)
				opts = opts or {}
				-- Combine default options with provided options
				local options = {
					hidden = true, -- Show hidden files
					no_ignore = false, -- Respect .gitignore
				}

				-- Add file/directory ignore patterns
				options.file_ignore_patterns = vim.tbl_extend(
					"force",
					opts.file_ignore_patterns or {},
					{ "^.git/" } -- Only ignore .git folder specifically
				)

				-- Special handling for live_grep
				if builtin_name == "live_grep" then
					-- Add specific additional_args for ripgrep to handle hidden files
					options.additional_args = function(args)
						return vim.list_extend(args, { "--hidden", "--glob", "!.git/" })
					end
				end

				-- Merge any additional options passed in
				for k, v in pairs(opts) do
					options[k] = v
				end

				return function()
					require("telescope.builtin")[builtin_name](options)
				end
			end

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- Set keymaps
			vim.keymap.set(
				"n", 
				"<leader><leader>", 
				telescope_with_hidden_no_git("find_files"), 
				{desc = "Find files (root dir)"}
			)
	
			vim.keymap.set(
				"n",
				"<leader>sg",
				telescope_with_hidden_no_git("live_grep"),
				{desc = "Live grep (root dir)"}
			)
		end,
	},
}
