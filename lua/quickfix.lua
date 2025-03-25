vim.keymap.set("n", "<A-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "∆", "<cmd>cnext<CR>") --  macos equiv
vim.keymap.set("n", "<A-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "˚", "<cmd>cprev<CR>") --  macos equiv
vim.keymap.set("n", "<A-h>", "<cmd>copen<CR>")
vim.keymap.set("n", "˙", "<cmd>copen<CR>") --  macos equiv
vim.keymap.set("n", "<space>q", "<cmd>cclose<CR>")
vim.keymap.set("n", "<space>q", "<cmd>cclose<CR>")

-- Function to remove the current item from the quickfix list
local function remove_qf_item()
	local curqfidx = vim.fn.line('.') - 1
	local qfall = vim.fn.getqflist()
	table.remove(qfall, curqfidx + 1)
	vim.fn.setqflist(qfall, 'r')
	local new_idx = math.min(curqfidx + 1, #qfall)
	vim.cmd("cc " .. new_idx)
	vim.cmd(":copen")
end

vim.api.nvim_create_user_command('RemoveQFItem', remove_qf_item, {})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "dd", ":RemoveQFItem<CR>", { noremap = true, silent = true })
	end
})
