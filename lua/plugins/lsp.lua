return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v4.x',
		config = function()
			vim.opt.signcolumn = 'yes'

			local lspconfig = require('lspconfig')

			local lspconfig_defaults = lspconfig.util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lspconfig_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)

			local lsp = require('lsp-zero')
			local cmp = require('cmp')

			cmp.setup({
				sources = {
					{ name = 'path' },
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lua' },
				},
				formatting = lsp.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					-- Navigate between completion items
					['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
					['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

					['<CR>'] = cmp.mapping.confirm({ select = false }),

					['<C-Space>'] = cmp.mapping.complete(),

					['<C-j>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),
				}),
				snipper = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
			})

			lsp.on_attach(function(_client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp.default_keymaps({ buffer = bufnr })
			end)

			require('mason').setup({})
			require('mason-lspconfig').setup({
				ensure_installed = { 'lua_ls', 'rust_analyzer', 'htmx', 'cssls', 'jinja_lsp' },
				handlers = {
					lsp.default_setup,

					lua_ls = function()
						local lua_opts = lsp.nvim_lua_ls()
						lspconfig.lua_ls.setup(lua_opts)
					end,

					jinja_lsp = function ()
						lspconfig.jinja_lsp.setup({
							filetypes =  { 'jinja', 'htmldjango' },
						})
					end
				},
			})
		end
	},

	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },

	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
}
