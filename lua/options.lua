-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers with relative number default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
-- Splits appear below and to the right
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Scroll offset
-- Lines above/below the cursor when moving vertically
vim.opt.scrolloff = 7
-- Characters before/after the cursor when moving horizontally
vim.opt.wrap = false
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 5

-- Command line completion
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full'
-- Ignore binaries and other artefacts
vim.opt.wildignore:append { '*.o,*.d,*.so,*.a' }
vim.opt.wildoptions = 'pum'

-----
-- Appearance
--

-- pop-up menu blend
-- enables pseudo-transparency for the popup-menu
vim.opt.pumblend = 15

-- show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- highlight the line the cursor is on
vim.opt.cursorline = true

-- Rebalance splits on nvim resize
vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    vim.cmd 'wincmd ='
  end,
})

-- show a vertical line at 80 columns
vim.opt.colorcolumn = '80'

-- display whitespace
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
-- tabs as `   ⇥`
-- trailing whitespace as `·`
-- non-breaking space as `·`
-- indicate line overflow when word wrap is disabled
vim.opt.listchars = {
  tab = '  ⇥',
  trail = '·',
  nbsp = '·',
  extends = '>',
  precedes = '<',
}

-- disable some of the above for netrw and git commits
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit',
  callback = function()
    vim.cmd.setlocal('nolist')
    vim.cmd.setlocal('colorcolumn=')
  end,
})


------
-- Formatting
--
-- Defaults if not otherwise specified
vim.opt.textwidth = 80
vim.opt.formatoptions = 'jcroql'
-- Tabs
-- set tab key to insert spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
-- round indent to multiple of 'shiftwidth'.  Applies to > and <
vim.opt.shiftround = true


------
-- Behaviour
-- allow backspacing over linebreaks, start of insert, and autoindent
vim.opt.backspace = { 'eol', 'start', 'indent' }
-- allow cursor movement keys to move to previous/next line
vim.opt.whichwrap:append '<,>,h,l'

-- Allow virtual editing (cursor can be positioned anywhere, even when there is
-- no character) in visual block mode.
vim.opt.virtualedit = 'block'


------
-- Spelling
--
vim.opt.spelllang = 'en_gb'
-- automatically enable spellcheck in git commits and markdown files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit,markdown',
  callback = function()
    vim.cmd 'set spell'
  end,
})

-- vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab
