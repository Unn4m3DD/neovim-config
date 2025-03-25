return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				'folke/lazydev.nvim',
				fr = 'lua',
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" }
						}
					}
				}
			}
		},
		config = function()
			require('lspconfig').lua_ls.setup {}
       			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then return end
					---@diagnostic disable-next-line: missing-parameter
					if client.supports_method('textDocument/formatting') then vim.keymap.set({ 'n', 'v', 'i' }, '<A-S-f>', function()
							vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
						end, { buffer = args.buf, noremap = true, silent = true })
						vim.keymap.set({ 'n', 'v', 'i' }, 'Ï', function()
							vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
						end, { buffer = args.buf, noremap = true, silent = true })
					end
				end
			})
		end,
	}
}
