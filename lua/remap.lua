-- leader key is space bar.
vim.g.mapleader = " "

-- Remaps for netrw mnemonically the same, just faster to type.
vim.keymap.set('n', '<leader>e', vim.cmd.Explore)
vim.keymap.set('n', '<leader>ve', vim.cmd.Vexplore)
vim.keymap.set('n', '<leader>se', vim.cmd.Sexplore)

-- Remove all windows except the current one.
vim.keymap.set('n', '<leader>o', vim.cmd.only)

-- Toggles search highlighting
vim.keymap.set('n', '<leader>hl', function ()
  vim.cmd.set('hlsearch!')
end)

-- Remap window related moves
vim.keymap.set('n', '<leader>hh', '<C-w>h')
vim.keymap.set('n', '<leader>l', '<C-w>l')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>H', '<C-w>H')
vim.keymap.set('n', '<leader>L', '<C-w>L')
vim.keymap.set('n', '<leader>J', '<C-w>J')
vim.keymap.set('n', '<leader>K', '<C-w>K')
