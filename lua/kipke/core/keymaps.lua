vim.g.mapleader = ' ' -- Make sure to set `mapleader` before lazy so your mappings are correct

local map = vim.keymap.set


map("i", "kj", "<Esc>l", { desc = "Exit insert mode with jk" })

map("v", "<A-k>", "<Cmd>call VSCodeCall('editor.action.moveLinesUpAction')<CR>", { desc ="move line down"}) -- move line up(n)
map("v", "<A-j>", "<Cmd>call VSCodeCall('editor.action.moveLinesDownAction')<CR>", { desc ="movae line up"}) -- move line down(n)

map("n", "<A-j>", "<Cmd>call VSCodeCall('editor.action.moveLinesDownAction')<CR>", { desc ="move line up"}) -- move line down(n)
map("n", "<A-k>", "<Cmd>call VSCodeCall('editor.action.moveLinesUpAction')<CR>", { desc ="move line down"}) -- move line up(n)

--- movement
map("n", "<leader><C-j>", "<Cmd>call VSCodeCall('workbench.action.navigateDown')<CR>", { desc ="navigate down"}) -- move line up(n)
map("n", "<leader><C-k>", "<Cmd>call VSCodeCall('workbench.action.navigateUp')<CR>", { desc ="navigate up"}) -- move line down(n)
map("n", "<leader><C-h>", "<Cmd>call VSCodeCall('workbench.action.navigateLeft')<CR>", { desc ="navigate left"}) -- move line up(n)
map("n", "<leader><C-l>", "<Cmd>call VSCodeCall('workbench.action.navigateRight')<CR>", { desc ="navigate right"}) -- move line down(n)

map("n","<leader>hf","<Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>", { desc = "find in files"});