local nnoremap = require('configure.keymap').nnoremap
local inoremap = require('configure.keymap').inoremap
local vnoremap = require('configure.keymap').vnoremap

-- General Purpose Keybinds
nnoremap('<leader>n', ':bn<Enter>')
nnoremap('<leader>N', ':bp<Enter>')
nnoremap('<leader>q', ':bdelete<Enter>')

nnoremap('<leader>c', '"+y')
nnoremap('<leader>p', '"+p')

-- FZF Keybinds
-- Remember:
--   - :Windows
--   - :History
--   - :Maps
--   - :Buffers
nnoremap('<leader>fm', ':Marks<cr>')
nnoremap('<leader>fb', ':Buffers<cr>')
nnoremap('<leader>fh', ':History<cr>')
nnoremap('<leader>fw', ':Windows<cr>')
nnoremap('<leader>fc', ':Colors<cr>')

-- Autocomplete commands
inoremap('<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
inoremap('<S-Tab>', 'pumbisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})

-- Neovim LSP Keybinds
nnoremap('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
nnoremap('K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
nnoremap('gc', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
nnoremap('<leader>d', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
nnoremap('<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')

-- Telescope Bindings
nnoremap('<C-p>', '<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_ivy({}))<cr>')
nnoremap('<C-o>', '<cmd>lua require("telescope.builtin").live_grep(require("telescope.themes").get_ivy({}))<cr>')
nnoremap('<leader>*', ':Rg <C-r>"<Enter>')

-- LspSaga
nnoremap('<F2>', '<cmd>Lspsaga rename<cr>')
nnoremap('<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<cr>')
vnoremap('<leader>ca', '<C-U>lua require("lspsaga.codeaction").range_code_action()<cr>')
nnoremap('g[', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<cr>')
nnoremap('g]', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<cr>')

-- Neo-tree
nnoremap('<leader>t', '<cmd>Neotree filesystem reveal left<cr>')
