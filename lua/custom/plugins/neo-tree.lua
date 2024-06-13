-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
  },
  cmd = "Neotree",
  keys = {
    { '\\',         '<Cmd>Neotree reveal left<CR>',               desc = 'NeoTree reveal',           silent = true },
    { '<Leader>nr', '<Cmd>Neotree reveal left<CR>',               desc = '[N]eoTree [R]eveal',       silent = true },
    { '<Leader>nf', '<Cmd>Neotree float reveal_force_cwd<CR>',    desc = '[N]eoTree [F]loat',        silent = true },
    { '<Leader>ng', '<Cmd>Neotree float git_status<CR>',          desc = '[N]eoTree [G]it status',   silent = true },
    { '<Leader>nb', '<Cmd>Neotree toggle show buffers right<CR>', desc = '[N]eoTree [B]uffers show', silent = true },
  },
  opts = {
    auto_clean_after_session_restore = false,
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          "node_modules"
        },
        always_show = { -- remains visible even if other settings would normally hide it
          ".gitignored",
        },
        never_show = {
          ".DS_Store",
          "thumbs.db"
        },
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<cr>'] = 'open_with_window_picker',
          ['h'] = 'close_node',
          ['l'] = 'open_with_window_picker',
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
    },
    event_handlers = {
      -- resize splits after Neotree reveal
      -- from https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes
      {
        event = "neo_tree_window_after_open",
        handler = function(args)
          if args.position == "left" or args.position == "right" then
            vim.cmd("wincmd =")
          end
        end
      },
      {
        event = "neo_tree_window_after_close",
        handler = function(args)
          if args.position == "left" or args.position == "right" then
            vim.cmd("wincmd =")
          end
        end
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
