vim.g.mapleader = ' ' -- Make sure to set `mapleader` before lazy so your mappings are correct

local map = vim.keymap.set


map("i", "kj", "<Esc>l", { desc = "Exit insert mode with jk" })

--- movementd
-- map("n", "<A-k>", "<Cmd>call VSCodeNotify('editor.action.moveLinesUpAction')<CR>", { desc ="move line down"}) -- move line up(n)
-- map("n", "<A-j>", "<Cmd>call VSCodeNotify('editor.action.moveLinesDownAction')<CR>", { desc ="move line up"}) -- move line down(n)

-- map("v", "<A-j>", '<cmd>call VSCodeNotifyRange("editor.action.moveLinesDownAction",line("v")-1, line("."), 1)<CR>', { desc ="movae line up"}) -- move line down(n)
-- map("v", "<A-k>", '<cmd>call VSCodeNotifyRange("editor.action.moveLinesDownAction",line("v")-1, line("."), 1)<CR>', { desc ="move line down"}) -- move line up(n)

map("n", "<leader><C-j>", "<Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>", { desc ="navigate down"}) -- move line up(n)
map("n", "<leader><C-k>", "<Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>", { desc ="navigate up"}) -- move line down(n)
map("n", "<leader><C-h>", "<Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>", { desc ="navigate left"}) -- move line up(n)
map("n", "<leader><C-l>", "<Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>", { desc ="navigate right"}) -- move line down(n)

map("n","<leader>hf","<Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>", { desc = "find in files"});

local opts = { noremap = true, silent = true }
-- Normal-mode commands
map('n', '<A-j>', ':MoveLine(1)<CR>', opts)
map('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
map('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
map('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
map('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
map('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
map('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
map('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)
