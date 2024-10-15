-- Create group to assign commands
local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = false })

vim.api.nvim_create_autocmd({ "filetype" }, {
    pattern = { "css", "scss" },
    desc = "Set shiftwidth of css and sass scripts to 4",
    callback = function()
		vim.bo.shiftwidth = 4
    end,
    group = autocmd_group,
})

