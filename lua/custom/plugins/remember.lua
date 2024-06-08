-- remember.nvim is a plugin to reopen files with the cursor in the last
-- position it was when the file was closed. Useful for files not attached to
-- sessions.
-- https://github.com/vladdoster/remember.nvim

return {
  "vladdoster/remember.nvim",
  version = "*",
  config = function()
    require("remember").setup({
      remember_dont_center = true,
    })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
