-- Prompts the user to pick a window and returns the ID of the window
-- https://github.com/s1n7ax/nvim-window-picker

return {
  "s1n7ax/nvim-window-picker",
  version = "2.*",
  config = function()
    require("window-picker").setup({
      hint = "floating-big-letter",
      picker_config = {
        floating_big_letter = {
          font = "ansi-shadow"
        },
      },
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        -- filter using buffer options
        bo = {
          -- the window will be ignored
          -- if the file type is one of following,
          filetype = { "neo-tree", "neo-tree-popup", "notify" },
          -- or if the buffer type is one of following
          buftype = { "terminal", "quickfix", "nofile" },
        },
      },
    })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
