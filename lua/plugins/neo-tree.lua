return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.xi",
		keys = {
			{ "<leader>pv", function () require("neo-tree.command").execute({ action = "show", position = "current", toggle = true, dir = vim.loop.cwd() }) end, desc = "Explore NeoTree (cwd)" }
		},
		opts = function()

			return {
				default_component_configs = {
					indent_size = 1,
					name = {
						trailing_slash = true,
					},
				},
				filesystem = {
					hijack_netrw_behavior = "open_current",
					filtered_items = {
						hide_dotfiles = false,
						never_show = { ".git" },
					},
				},
			}
		end,
	dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		}
	}
}
