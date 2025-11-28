local hf = require("luasnip-helper-funcs")

local function in_math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

local function in_text()
    return not in_math()
end

return {
    --#region math
    s({ trig = "([^%a])*", snippetType = "autosnippet", desc = "\\cdot", wordTrig = false, regTrig = true, condition = in_math },
        {f(hf.first_capt), t("\\cdot ")}),
    s({ trig = "([^%a])ff", snippetType = "autosnippet", desc = "Fraction a divided by b", wordTrig = false, regTrig = true, condition = in_math },
        fmta([[ <>\frac{<>}{<>}]], { f(hf.first_capt), i(1, "a"), i(2, "b") })),
    s({ trig = "([^%a])bb", snippetType = "autosnippet", desc = "binomial coefficient a over b", wordTrig = false, regTrig = true, condition = in_math },
        fmta([[ <>\binom{<>}{<>}]], { f(hf.first_capt), i(1, "a"), i(2, "b") })),
    s({ trig = "([^%a])tt", snippetType = "autosnippet", desc = "Text node in math mode", wordTrig = false, regTrig = true, condition = in_math },
        fmta([[ <>\text{<>}]], { f(hf.first_capt), i(1), })),
    s({ trig = ";mn", snippetType = "autosnippet", desc = "\\mathbb{n}", wordTrig = false, condition = in_math },
        {t("\\mathbb{"), i(1, "N"), t("}")}),
    s({ trig = "f(", snippetType = "autosnippet", desc = "Function f(x)", wordTrig = false, condition = in_math },
        {t("f("), i(1, "x"), t(")")}),
    s({ trig = ";fa", snippetType = "autosnippet", desc = "For all x in X", wordTrig = false, condition = in_math },
        fmta([[\forall <> \in \mathbb{<>}]], {i(1, "x"), i(2, "N")})),
    s({ trig = ";fo", snippetType = "autosnippet", desc = "There's at least one x in X", wordTrig = false, condition = in_math },
        fmta([[\exists <> \in \mathbb{<>}]], {i(1, "x"), i(2, "N")})),
    s({ trig = "sum", snippetType = "snippet", desc = "A sum", wordTrig = false },
        fmta([[\sum_{<>}^{<>} <>]], { i(1, "k=1"), i(2, "n"), i(3, "k") })),
    --#endregion math

    --#region text
    s({trig = "([^%a])mm", snippetType = "autosnippet", wordTrig = false, regTrig = true, condition = in_text },
        fmta( "<>$<>$", { f(hf.first_capt), d(1, hf.get_visual), })),
    s({ trig = "\"\"", snippetType = "autosnippet", desc = "Quote selection", wordTrig = false, condition = in_text },
        fmta("``<>''", { d(1, hf.get_visual) })),
    s({ trig = "([^%a])cc", snippetType = "autosnippet", desc = "put selection in \\textcolor command", wordTrig = false, regTrig = true, condition = in_text },
        fmta("<>\\textcolor{<>}{<>}", { f(hf.first_capt), i(1, "color"), d(2, hf.get_visual) })),
    s({ trig = "([^%a])cb", snippetType = "autosnippet", desc = "put selection in block with a \\color command", wordTrig = false, regTrig = true, condition = in_text },
        fmta("<>{\\color{<>}<>}", { f(hf.first_capt), i(1, "color"), d(2, hf.get_visual) })),
    s({ trig = "emph", snippetType = "snippet", desc = "emphasise selection", wordTrig = false, condition = in_text },
        fmta("\\emph{<>}", { d(1, hf.get_visual) })),
    --#endregion text

    s({ trig = "sec", snippetType = "snippet", desc = "section*", wordTrig = false },
        fmta(
            [[
            \section*{<>}
            <>
            ]], { i(1, "Section Name"), i(0) })
    ),
    s({ trig = "ssec", snippetType = "snippet", desc = "subsection*", wordTrig = false },
        fmta(
            [[
            \subsection*{<>}
            <>
            ]], { i(1, "Section Name"), i(0) })
    ),
    s({ trig = "eq", snippetType = "snippet", desc = "equation*", wordTrig = false },
        {
            t({ "\\begin{equation*}", "    " }), i(1),
            t({ "", "\\end{equation*}" })
        }
    ),
    s({ trig = "env", snippetType = "snippet", desc = "user specified environment" },
        fmta(
        [[
        \begin{<>}
            <>
        \end{<>}
        ]], { i(1), i(2), rep(1) })
    ),

    s({ trig = "tabl(ed?)(%d+)x(%d+)", snippetType = "autosnippet", desc = "Table of A x B size", regTrig = true, wordTrig = false},
        fmta(
            [[
            \begin{tabular}{<>}
            <>
            \end{tabular}
            ]],
            {
                f(function (_, snip)
                    local cols = tonumber(snip.captures[3])
                    local text = ""

                    local insert
                    local suffix
                    if snip.captures[1] == "ed" then
                        text = text .. " "
                        suffix = "| "
                        insert = "|c"
                    else
                        suffix = " "
                        insert = " c"
                    end

                    for k = 1, cols do
                        text = text .. insert
                    end

                    return text .. suffix
                end),
                d(1, function (_, snip)
                    local rows = tonumber(snip.captures[2])
                    local cols = tonumber(snip.captures[3])
                    local nodes = {}
                    local ins_num = 1

                    for j = 1, rows do
                        table.insert(nodes, r(ins_num, tostring(j) .. "x1", i(1)))
                        ins_num = ins_num + 1
                        for k = 2, cols do
                            table.insert(nodes, t(" & "))
                            table.insert(nodes, r(ins_num, tostring(j) .. "x" .. tostring(k), i(1)))
                            ins_num = ins_num + 1
                        end
                        table.insert(nodes, t({"\\\\", ""}))
                    end

                    -- fix last node
                    nodes[#nodes] = t("\\\\")
                    return sn(nil, nodes)
                end),
            }))
}
