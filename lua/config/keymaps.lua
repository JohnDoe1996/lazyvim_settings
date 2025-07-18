-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


--[设置 cmd+c cmd+shift+c ctrl+c ctrl+shift+c  在V模式下复制]
vim.keymap.set("v", "<D-c>", '"+yy', { noremap = true, silent = true })
vim.keymap.set("v", "<D-S-c>", '"+yy', { noremap = true, silent = true })
vim.keymap.set("v", "<C-c>", '"+yy', { noremap = true, silent = true })
vim.keymap.set("v", "<C-S-c>", '"+yy', { noremap = true, silent = true })

--[设置 cmd+x cmd+shift+x ctrl+x ctrl+shift+x  在V模式下剪切]
vim.keymap.set("v", "<D-x>", '"+dd', { noremap = true, silent = true })
vim.keymap.set("v", "<D-S-x>", '"+dd', { noremap = true, silent = true })
vim.keymap.set("v", "<C-x>", '"+dd', { noremap = true, silent = true })
vim.keymap.set("v", "<C-S-x>", '"+dd', { noremap = true, silent = true })

-- [ 设置 cmd+v cmd+shift+v ctrl+v ctrl+shift+v 在编辑模式 进行粘贴操作 ]
vim.keymap.set("i", "<C-v>", '<Esc>"+pa', { noremap = true, silent = true })
vim.keymap.set("i", "<C-S-v>", '<Esc>"+pa', { noremap = true, silent = true })
vim.keymap.set("i", "<D-v>", '<Esc>"+pa', { noremap = true, silent = true })
vim.keymap.set("i", "<D-S-v>", '<Esc>"+pa', { noremap = true, silent = true })
vim.keymap.set("v", "<C-v>", '"+p', { noremap = true, silent = true })
vim.keymap.set("v", "<C-S-v>", '"+p', { noremap = true, silent = true })
vim.keymap.set("v", "<D-v>", '"+p', { noremap = true, silent = true })
vim.keymap.set("v", "<D-S-v>", '"+p', { noremap = true, silent = true })

--  --  在编辑模式下  ctrl + 回车 往下增加一行  ctrl + shift + 回车 往上增加一行  好像会有冲突先注释掉
--  vim.keymap.set("i", "<C-CR>", "<Esc>o", { noremap = true, silent = true })
--  vim.keymap.set("i", "<C-CR>", "<Esc>o", { noremap = true, silent = true })
--  vim.keymap.set("i", "<D-S-CR>", "<Esc>O", { noremap = true, silent = true })
--  vim.keymap.set("i", "<D-S-CR>", "<Esc>O", { noremap = true, silent = true })

