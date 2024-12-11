-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

--  HACK: Change tabs (buffers)
vim.keymap.set('n', '<s-M-h>', '<cmd>bprevious<CR>', { desc = '[Left] buffer' })
vim.keymap.set('n', '<s-M-l>', '<cmd>bnext<CR>', { desc = '[Right] buffer' })
vim.keymap.set('n', '<s-M-j>', function()
  vim.ui.input({ prompt = 'Close buffer? [Y/n] ' }, function(input)
    if input == 'y' or input == 'Y' or input == '' then
      vim.api.nvim_exec2('bd', {})
    end
  end)
end, { desc = '[Close] buffer' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })

vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, { desc = '[E]rror messages (Open diagnostic)' })
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = '[Q]uickfix list (Open diagnostic)' })

-- Greatest remap ever
vim.keymap.set('x', '<leader>P', '"_dP', { desc = '[P]reserve [P]aste' })
vim.keymap.set('n', '<leader>P', '"_dP', { desc = '[P]reserve [P]aste' })

vim.keymap.set('n', '<leader>D', '"_d', { desc = '[D]elete [V]oid' })
vim.keymap.set('v', '<leader>D', '"_d', { desc = '[D]elete [V]oid' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

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
