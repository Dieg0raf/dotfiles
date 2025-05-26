vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
vim.cmd("set number")
vim.cmd("set nohidden") -- Don't use hidden buffers
vim.cmd("set relativenumber")
vim.cmd("set ignorecase") -- Ignore case when searching

-- Keybinds --
vim.g.mapleader = " "

-- Tab config --
vim.keymap.set("n", "H", ":bprevious<CR>", {})
vim.keymap.set("n", "L", ":bnext<CR>", {})

-- Buffer Deletion (Close current buffer)
vim.keymap.set("n", "<C-w>", ":bd<CR>", {})

-- Pane Closing (Close current split without affecting others)
vim.keymap.set("n", "<leader>p", ":close<CR>", {})

-- Pane Navigation --
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", {})
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", {})
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", {})
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", {})
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", {})
vim.keymap.set("n", "<leader>h", ":split<CR>", {})

-- Copy to clipboard --
vim.keymap.set("v", "<leader>y", '"+y', {})

-- Redo an Undo --
vim.keymap.set("n", "U", "<C-r><CR>", { noremap = true })

vim.opt.signcolumn = "yes" -- Show sign column
