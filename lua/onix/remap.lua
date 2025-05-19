-- map leader to <Space>
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File tree" })

vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
vim.keymap.set("n", "E", "ge", { noremap = true, silent = true })

vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])


vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Down>', '<cmd>cnext<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Up>', '<cmd>cprevious<cr>', { noremap = true, silent = true })

vim.keymap.set('n', '<S-H>', "<cmd>bp<cr>", { noremap = true, silent = true })
vim.keymap.set('n', '<S-L>', "<cmd>bn<cr>", { noremap = true, silent = true })

vim.keymap.set('n', '<c-a>', "<c-a>l", { noremap = true, silent = true })
vim.keymap.set('n', '<c-x>', "<c-x>h", { noremap = true, silent = true })

