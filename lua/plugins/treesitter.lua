return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local TS = require('nvim-treesitter')

        TS.setup {
            install_dir = vim.fn.stdpath('data') .. '/site',
        }

        TS.install { "lua", "c", "javascript", "typescript", "rust", "toml", "java" }


        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
            callback = function(ev)
                local lang = vim.treesitter.language.get_lang(ev.match)
                local installed = TS.get_installed()

                if vim.tbl_contains(installed, lang) then
                    vim.treesitter.start()
                end
            end
        })
    end,
}
