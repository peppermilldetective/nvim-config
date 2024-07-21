local function nmap(lhs, rhs, desc)
  vim.keymap.set('n', lhs, rhs, { desc = desc })
end

local function tmap(lhs, rhs, desc)
  vim.keymap.set('t', lhs, rhs, { desc = desc })
end

-- Quit Everything
nmap('<leader>qq', '<cmd>qa<cr>', '[Q]uit [A]ll')

-- Diagnostic keymaps
nmap('<leader>e', vim.diagnostic.open_float, 'Show diagnostic [E]rror messages')
nmap('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
tmap('<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
nmap('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
nmap('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
nmap('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
nmap('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

-- CTRL-P functionality similar to VSCode
nmap('<C-p>', '<cmd>Telescope find_files<cr>', 'Find Files')

-- Buffer navigation
nmap('H', '<cmd>bp<cr>', 'Previous Buffer')
nmap('L', '<cmd>bn<cr>', 'Next Buffer')

-- Buffer manipulation
nmap('<leader>bd', '<cmd>bd<cr>', '[B]uffer [D]elete')
