return {
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	keys = {
		-- add a keymap to browse plugin files
		{ "<leader>pf", function() require('telescope.builtin').find_files({}) end, desc = "Find file" },
		{ "<C-p>", function() require('telescope.builtin').git_files({}) end, desc = "Git search" },
		{
			"<leader>ps",
			function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }); end,
			desc = "Grep search"
		}
	},
	dependencies = { 'nvim-lua/plenary.nvim' }
}
