-- Common Keymaps
-- move fastly
vim.keymap.set("", "H", "10h")
vim.keymap.set("", "J", "10j")
vim.keymap.set("", "K", "10k")
vim.keymap.set("", "L", "10l")
-- move in tabs
vim.keymap.set("n", "tj", ":Tabnext<CR>")
vim.keymap.set("n", "tk", ":TabNext<CR>")
-- move in buffers
vim.keymap.set("n", "bj", ":bnext<CR>")
vim.keymap.set("n", "bk", ":bNext<CR>")

-- NvimTree
vim.keymap.set("", "nt", ":silent NvimTreeToggle<CR>")
