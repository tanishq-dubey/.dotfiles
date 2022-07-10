local opts = { noremap = true, silent = true }
vim.g.maplocalleader = ","
vim.g.mapleader = ","


local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Escape in terminal Mode
keymap('t', '<M-Esc>', '<C-\\><C-n>', {noremap = true})

-- Vim Tmux Keymaps
keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', { noremap = true, silent = true })
keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', { noremap = true, silent = true })
keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', { noremap = true, silent = true })
keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', { noremap = true, silent = true })

keymap('n', '<Leader>vp', ':VimuxPromptCommand<CR>', {})
keymap('n', '<Leader>vl', ':VimuxRunLastCommand<CR>', {})

-- LSP Keymaps
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
