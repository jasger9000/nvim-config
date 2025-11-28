local hf = require('luasnip-helper-funcs')

return {
    s({ trig = "([^%a])<<", snippetType = "autosnippet", desc = "html tag", regTrig = true, wordTrig = false },
        fmt("{}<{}>{}</{}>", { f(hf.first_capt), i(1), d(2, hf.get_visual), rep(1) }, { delimiters = "{}" })),
}
