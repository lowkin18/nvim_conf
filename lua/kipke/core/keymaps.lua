vim.g.mapleader = '<Space>' -- Make sure to set `mapleader` before lazy so your mappings are correct

local map = vim.keymap.set

map("i", "kj", "<Esc>l", { desc = "Exit insert mode with jk" })

map("i", "<A-j>", "<C-o>gj", { desc ="move line down"}) -- move line up(n)
map("i", "<A-k>", "<C-o>gk", { desc ="move line up"}) -- move line down(n)

map("n", "<A-j>", ":m .+1<CR>==", { desc ="move line down"}) -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==", { desc ="move line up"}) -- move line down(n)

map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc ="move line up"}) -- move line down(v)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc ="move line down"}) -- move line up(v)a