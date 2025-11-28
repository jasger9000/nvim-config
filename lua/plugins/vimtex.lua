return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = 'zathura_simple' -- replace with zathura if you have xdotool
    end,
}
