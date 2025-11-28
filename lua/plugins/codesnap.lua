return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	init = function()
		vim.keymap.set('v', '<leader>sc', ':Silicon<CR>');
	end,
	config = function()
		require("nvim-silicon").setup({
			font = "Fira Code Nerd Font Mono=34;",
			theme = "Monokai Extended",
			background = "#45424b",
			window_title = function()
				return vim.fn.fnamemodify(
					vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t"
				)
			end
		})
	end
}
