return {
  "sainnhe/sonokai",
  priority = 1000,
  config = function()
    vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_transparent_background = 1
    vim.g.sonokai_spell_foreground = "colored"

    -- greyify some elements
    -- bg1: #33353F -> #353535
    -- bg2: #363944 -> #393939
    -- bg3: #3B3E48 -> #3e3e3e
    -- bg4: #414550 -> #454545
    vim.g["sonokai_colors_override"] = {
      bg1 = {'#353535', '236'},
      -- bg1 = {'#303030', '255'},
      bg2 = {'#393939', '237'},
      bg3 = {'#3e3e3e', '237'},
      -- bg3 = {'#ff0000', '160'},
      bg4 = {'#454545', '238'},
    }

    -- https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#customizing-themes
    -- local sonokai_statusline = require('lualine.themes.sonokai')
    -- sonokai_statusline.normal.c.bg = '#151515'
    -- require('lualine').setup {
    --  options = { theme  = sonokai_statusline },
    -- }

    vim.api.nvim_create_autocmd("ColorScheme",
      {
        pattern = "*",
        callback = function()
          -- keep line numbers opaque
          -- vim.api.nvim_set_hl(0, "CursorLineNr", { bg="#2e2e2e", fg="#e2e2e2" })
          -- vim.api.nvim_set_hl(0, "CursorLineNr", { bg="#252525", fg="#e2e2e2" })
          vim.api.nvim_set_hl(0, "CursorLineNr", { bg="#111111", fg="#e2e2e2" })
          -- vim.api.nvim_set_hl(0, "LineNr",       { bg="#2e2e2e", fg="#5f5f5f" })
          -- vim.api.nvim_set_hl(0, "LineNr",       { bg="#1d1d1d", fg="#8f8f8f" })
          vim.api.nvim_set_hl(0, "LineNr",       { bg="#151515", fg="#6f6f6f" })
        end,
      })

    vim.cmd.colorscheme "sonokai"
  end
}
