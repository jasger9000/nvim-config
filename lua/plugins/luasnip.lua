return {
    "L3MON4D3/LuaSnip",
	version = "v2.*",
    build = "make install_jsregexp",
    event = "InsertEnter",
    config = function()
        require("luasnip.loaders.from_lua").lazy_load({paths = "./lua/luasnip/"})
        local ls = require("luasnip")
        local types = require("luasnip.util.types")

        ls.setup({
            update_events = {"TextChanged", "TextChangedI"},
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
            ext_opts = {
                [types.insertNode] = {
                    active = {
                        virt_text = {{" "},{"", "Blue"}}
                    },
                    passive = {
                        virt_text = {{" "},{"", "Teal"}}
                    },
                    visited = {
                        virt_text = {{" "},{"", "Teal"}}
                    },
                }
            }
        })

        vim.keymap.set({"i", "s"}, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, {silent = true})
    end
}
