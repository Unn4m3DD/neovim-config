require("config.lazy")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("i", "<C-s>", "<C-o>:w<CR>", {noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-s>", ":w<CR>", {noremap = true, silent = true })
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.relativenumber = true
vim.opt.signcolumn = "yes"
vim.keymap.set({ "n", "v" }, "<C-j>", "10j")
vim.keymap.set({ "n", "v" }, "<C-k>", "10k")
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})
vim.opt.tabstop = 2
