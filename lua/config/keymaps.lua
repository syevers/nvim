-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to Windows clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to Windows clipboard" })
