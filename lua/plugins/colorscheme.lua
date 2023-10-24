return {
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme('rose-pine')

			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		end
	},
}
