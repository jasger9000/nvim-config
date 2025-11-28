vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- open search
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);

-- toggle inlay hints
vim.keymap.set('n', '<leader>ti', function () vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end);

-- toggle diagnostics from text to line mode
vim.keymap.set('n', '<leader>td', function ()
    local config = vim.diagnostic.config(nil)
    if config ~= nil then
        vim.diagnostic.config({
            virtual_text = not config.virtual_text,
            virtual_lines = not config.virtual_lines
        })
    end
end);

-- Moving stuff that's selected
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor stays in front when J'ing
vim.keymap.set("n", "J", "mZJ`z")

-- Highlighted stays in middle of screen when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- replace without overwriting clipboard buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("", "<up>", "<nop>")
vim.keymap.set("", "<down>", "<nop>")
vim.keymap.set("", "<left>", "<nop>")
vim.keymap.set("", "<right>", "<nop>")

-- buffer switching
vim.keymap.set("n", "<C-D>", "<cmd>:bd<CR>")
vim.keymap.set("n", "<C-J>", "<cmd>:bp<CR>")
vim.keymap.set("n", "<C-K>", "<cmd>:bn<CR>")

-- replace highlighted
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make buffer executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
