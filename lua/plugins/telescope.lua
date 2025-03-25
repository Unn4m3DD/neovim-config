return {
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		},
		config = function()
			require('telescope').setup {
				extensions = { fzf = {} }
			}
			require('telescope').load_extension('fzf')

			vim.keymap.set('n', "<C-p>", require('telescope.builtin').find_files)
			vim.keymap.set('n', "<C-A-p>", require('telescope.builtin').live_grep)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
			vim.keymap.set('n', "<space>gd", require('telescope.builtin').lsp_references)


			vim.keymap.set('n', "<space><C-A-p>", function()
				require('telescope.builtin').live_grep({
					cwd = vim.fn.stdpath("config")
				})
			end)
			vim.keymap.set('n', "<space><C-p>", function()
				require('telescope.builtin').find_files({
					cwd = vim.fn.stdpath("config")
				})
			end)
		end
	}
}
