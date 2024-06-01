-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- turn off search highlighting with <Enter> in normal mode
vim.keymap.set('n', '<CR>', '<cmd>nohlsearch<CR>', { silent = true })
-- or completely unset the 'last search pattern' register
-- nnoremap <silent> <CR> :let @/ = ""<CR>

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Remap wildmenu keys
vim.api.nvim_set_keymap('c', '<Up>',    'wildmenumode() ? "<Left>"  : "<Up>"',    { expr = true, noremap = true })
vim.api.nvim_set_keymap('c', '<Down>',  'wildmenumode() ? "<Right>" : "<Down>"',  { expr = true, noremap = true })
vim.api.nvim_set_keymap('c', '<Left>',  'wildmenumode() ? "<Up>"    : "<Left>"',  { expr = true, noremap = true })
vim.api.nvim_set_keymap('c', '<Right>', 'wildmenumode() ? "<Down>"  : "<Right>"', { expr = true, noremap = true })

-- Leave insert mode by hitting jk
vim.keymap.set('i', 'jk', '<esc>jk')
vim.keymap.set('i', 'kj', '<esc>kj')
-- or is this dangerous?
-- vim.keymap.set('i', 'JK', '<esc>')
-- vim.keymap.set('i', 'KJ', '<esc>')
-- also command mode
vim.keymap.set('c', 'jk', '<C-C>')
vim.keymap.set('c', 'kj', '<C-C>')

-- quit nvim with ctrl+q
vim.keymap.set('n', '<C-q>', '<cmd>quitall<cr>')
vim.keymap.set('i', '<C-q>', '<esc><cmd>quitall<cr>')


--
-- Leader key actions
--
-- TODO add <leader>qa? or <leader>qq maybe
-- write file
vim.keymap.set('n', '<leader>w', ':w<CR>', { silent = true })

-- zoom a window split
vim.keymap.set({ 'n', 'v' }, '<Leader>z', '<Cmd>wincmd |<CR>')
-- rebalance splits
vim.keymap.set({ 'n', 'v' }, '<Leader>=', '<Cmd>wincmd =<CR>')

-- highlight matching words, like *, but without jumping
-- https://vimdoc.sourceforge.net/htmldoc/pattern.html#star
vim.keymap.set({ 'n' }, '<Leader>*', "<Cmd>let @/='\\<'.expand('<cword>').'\\>'<bar>set hlsearch<CR>")

-- add semicolon to end of line
vim.keymap.set({ 'n' }, '<Leader>;', "m'A;<esc>`'")

-- vim: ts=2 sts=2 sw=2 et
