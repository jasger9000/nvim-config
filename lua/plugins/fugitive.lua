return {
	'tpope/vim-fugitive',
	keys = {
		{ "<leader>gm", vim.cmd.Git, desc ="Show git menu" },
		{ "<leader>gd", vim.cmd.Gdiff, desc ="Open git diff" }
	}
}

