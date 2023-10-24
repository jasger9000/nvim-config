return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		config = function()
			local lsp = require('lsp-zero')
			lsp.extend_lspconfig()

			local cmp = require('cmp')
			cmp.setup({
				sources = {
					{ name = 'path' },
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lua' },
				},
				formatting = lsp.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					['<Space>'] = cmp.mapping.confirm({ select = false }),
					['<Enter>'] = cmp.mapping.confirm({ select = false }),
				}),
			})

			lsp.on_attach(function(_client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp.default_keymaps({ buffer = bufnr })
			end)

			require('mason').setup({})
			require('mason-lspconfig').setup({
				ensure_installed = { 'lua_ls', 'rust_analyzer' },
				handlers = {
					lsp.default_setup,
					lua_ls = function()
						local lua_opts = lsp.nvim_lua_ls()
						require('lspconfig').lua_ls.setup(lua_opts)
					end,
				},
			})
		end
	},

	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },

	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },
}
