vim.g.mapleader = " "

-- open search
vim.keymap.set("n", "<leader>npv", vim.cmd.Ex);

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

-- capitatilazion can get fucked
vim.cmd("command WQ wq")
vim.cmd("command Wq wq")
vim.cmd("command W w")
vim.cmd("command Q q")

-- switch projects
vim.keymap.set("n", "C-f", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- replace highlighted
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make buffer executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
