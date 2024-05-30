return {
  'aserowy/tmux.nvim',
  version = "*",
  config = function ()
    require('tmux').setup {
      navigation = {
        enable_default_keybindings = false,
        persist_zoom = true,
      },
      resize = {
        enable_default_keybindings = false,
      },
    }
  end,
  keys = {
    { '<S-Left>',  '<cmd>lua require("tmux").move_left()<cr>',   desc = "Switch pane left" },
    { '<S-Down>',  '<cmd>lua require("tmux").move_bottom()<cr>', desc = "Switch pane down" },
    { '<S-Up>',    '<cmd>lua require("tmux").move_top()<cr>',    desc = "Switch pane up" },
    { '<S-Right>', '<cmd>lua require("tmux").move_right()<cr>',  desc = "Switch pane right" },
  },
}
