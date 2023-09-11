if vim.g.vscode then
    -- VSCode extension
    require("kipke.core.keymaps")
    
else
    -- ordinary Neovim
    require("kipke.core.keymaps") 
end