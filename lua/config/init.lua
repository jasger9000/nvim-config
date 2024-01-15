require("config.remap")
require("config.set")

--#region Setup lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
--#endregion

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	defaults = {
		lazy = false,
		version = false, -- always use the latest git commit
	},
	install = {
		missing = true,
		colorscheme = { "rose-pine" },
	},
	checker = { enabled = false },
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
});



