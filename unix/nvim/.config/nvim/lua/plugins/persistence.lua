return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
    options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
    pre_save = nil,
    save_empty = false
  },
  -- init = function()
  --   -- restore the session for the current directory automatically
  --   vim.api.nvim_create_autocmd("VimEnter", {
  --     callback = function()
  --       -- only load the session if nvim was started with no args
  --       if vim.fn.argc() == 0 then
  --         require("persistence").load()
  --       end
  --     end,
  --   })
  -- end,
}