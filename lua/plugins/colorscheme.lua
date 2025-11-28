return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            integrations = {
                alpha = true,
                mason = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        ok = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                nvim_surround = true,
                treesitter = true,
                telescope = { enabled = true },
            },
            custom_highlights = function(colors)
                return {
                    Red = { fg = colors.red },
                    Green = { fg = colors.green },
                    Orange = { fg = colors.peach },
                    Yellow = { fg = colors.yellow },
                    Blue = { fg = colors.blue },
                    Teal = { fg = colors.teal },
                    Mauve = { fg = colors.mauve },
                    Pink = { fg = colors.pink },
                }
            end,
        })

        vim.cmd.colorscheme("catppuccin")
    end
}
