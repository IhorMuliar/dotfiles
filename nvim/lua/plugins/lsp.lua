return {
	"neovim/nvim-lspconfig",
	dependencies = { 'saghen/blink.cmp' },
	config = function()
		-- Get blink.cmp capabilities for LSP
		local capabilities = require('blink.cmp').get_lsp_capabilities()

		-- Configure diagnostics
		vim.diagnostic.config({
			virtual_text = true,  -- Show diagnostics inline
			signs = true,         -- Show signs in the gutter
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				border = 'rounded',
				source = 'always',
			},
		})

		-- Configure rust-analyzer before enabling
		vim.lsp.config('rust_analyzer', {
			cmd = { 'rust-analyzer' },
			filetypes = { 'rust' },
			root_markers = { 'Cargo.toml' },
			capabilities = capabilities,
			settings = {
				['rust-analyzer'] = {
					cargo = {
						allFeatures = true,
					},
				},
			},
		})

		-- Enable language servers with blink.cmp capabilities
		vim.lsp.enable('lua_ls', { capabilities = capabilities })
		vim.lsp.enable('ts_ls', { capabilities = capabilities })
		vim.lsp.enable('pyright', { capabilities = capabilities })
		vim.lsp.enable('rust_analyzer')

		-- Auto-format on save
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.supports_method('textDocument/formatting') then
					vim.api.nvim_create_autocmd('BufWritePre', {
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
						end,
					})
				end
			end,
		})
	end
}
