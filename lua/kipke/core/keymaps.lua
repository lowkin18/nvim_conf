vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

local map = vim.keymap.set

map("i", "kj", "<Esc>l", { desc = "Exit insert mode with kj" })

-- normal mode
map("n", "<CR>", "$a<CR>", { desc ="create new line and go"}) -- move line up(n)





if vim.g.vscode then
    local neovim_api = require("kipke.core.vscode-neovim")
    map("n", "<leader>k", neovim_api.call('workbench.action.nextEditorInGroup'), { desc ="create new line and go"}) -- move line up(n)
end




 