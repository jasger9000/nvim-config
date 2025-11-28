return {
    'echasnovski/mini.indentscope',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- symbol = "▏",
        symbol = "│",
        options = { try_as_border = true },
    },
}
