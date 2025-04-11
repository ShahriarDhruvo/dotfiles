local function search_with_hidden(builtin_name, opts)
  opts = opts or {}
  local options = {
    hidden = true,
    no_ignore = true,
  }

  options.file_ignore_patterns = vim.tbl_extend(
    "force",
    opts.file_ignore_patterns or {},
    { "^.git/" } -- Only ignore .git folder specifically
  )

  if builtin_name == "live_grep" then
    options.additional_args = function(args)
      return vim.list_extend(args, { "--hidden", "--glob", "!.git/" })
    end
  end

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
      search_with_hidden("find_files"),
      desc = "Find including hidden files (root dir)",
    },
    {
      "<leader>ff",
      search_with_hidden("find_files", { cwd = vim.fn.getcwd() }),
      desc = "Find including hidden files (cwd)",
    },
    {
      "<leader>fg",
      search_with_hidden("live_grep"),
      desc = "Live grep (root dir)",
    },
    {
      "<leader>fG",
      search_with_hidden("live_grep", { cwd = vim.fn.getcwd() }),
      desc = "Live grep (cwd)",
    },
  },
}
