return {
    {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            vim.opt.signcolumn = 'yes'
            vim.diagnostic.config({ virtual_text = true }) -- fix diagnostics not being displayed after line

            local lspconfig = require('lspconfig')

            local lspconfig_defaults = lspconfig.util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', 'ge', vim.diagnostic.open_float, opts)
                    vim.keymap.set('n', 'gne', function() vim.diagnostic.jump({ count = 1 }) end, opts)
                    vim.keymap.set('n', 'gpe', function() vim.diagnostic.jump({ count = -1 }) end, opts)
                    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'x' }, '<F3>', vim.lsp.buf.format, opts)
                    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
                end,
            })

            local cmp = require('cmp')
            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                },
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                experimental = {
                    ghost_text = true,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = 'select' }),

                    ['<C-h>'] = cmp.mapping.scroll_docs(4),
                    ['<C-l>'] = cmp.mapping.scroll_docs(-4),

                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
            })

            vim.lsp.util.open_floating_preview = (function(orig)
                return function(contents, syntax, opts, ...)
                    opts = opts or {}
                    opts.border = opts.border or "rounded"
                    return orig(contents, syntax, opts, ...)
                end
            end)(vim.lsp.util.open_floating_preview)

            cmp.setup.filetype("tex", {
                sources = {
                    { name = 'vimtex' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                },
            })

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'rust_analyzer', 'cssls', 'html' },
                handlers = {
                    function(server)
                        lspconfig[server].setup({})
                    end,

                    html = function()
                        lspconfig.html.setup({
                            filetypes = { 'html', 'templ', 'htmldjango' },
                        })
                    end
--					jinja_lsp = function ()
--						lspconfig.jinja_lsp.setup({
--							filetypes = { 'jinja', 'rust', 'htmldjango' },
--							capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
--							root_dir = function(fname)
--								return "."
--								--return nvim_lsp.util.find_git_ancestor(fname)
--							end,
--							init_options = {
--								templates = './templates',
--								backend = { './src' },
--								lang = "rust"
--							},
--						})
--					end
                },
            })
        end
    },

    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    {
        "micangl/cmp-vimtex",
        ft = "tex",
        config = function()
            require('cmp_vimtex').setup({})
        end,
    },
}
