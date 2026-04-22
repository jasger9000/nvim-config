return {
	'nvim-telescope/telescope.nvim',
    version = '*',
	keys = {
		-- add a keymap to browse plugin files
		{ "<leader>pf", function() require('telescope.builtin').find_files({}) end, desc = "Find file" },
		{ "<C-p>", function() require('telescope.builtin').git_files({}) end, desc = "Git search" },
		{
			"<leader>ps",
			function() require('telescope.builtin').live_grep({}); end,
			desc = "Grep search"
		}
	},
	dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-tree/nvim-web-devicons',
    }
}
