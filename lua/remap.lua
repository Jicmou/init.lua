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
