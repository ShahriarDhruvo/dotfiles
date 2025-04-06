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

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader><leader>",
      telescope_with_hidden_no_git("find_files"),
      desc = "Find files (root dir)",
    },
    {
      "<leader>ff",
      telescope_with_hidden_no_git("find_files", { cwd = vim.fn.getcwd() }),
      desc = "Find files (cwd)",
    },
    {
      "<leader>fg",
      telescope_with_hidden_no_git("live_grep"),
      desc = "Live grep (root dir)",
    },
    {
      "<leader>fG",
      telescope_with_hidden_no_git("live_grep", { cwd = vim.fn.getcwd() }),
      desc = "Live grep (cwd)",
    },
  },
}
