vim.g.mapleader = " "

vim.keymap.set("n", "n", "nzz", { remap = false })
vim.keymap.set("n", "N", "Nzz", { remap = false })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { remap = false })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { remap = false })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { remap = false })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { remap = false })

vim.keymap.set("n", "]b", ":bnext<CR>")
vim.keymap.set("n", "[b", ":bprev<CR>")
vim.keymap.set("n", "]B", ":bfirst<CR>")
vim.keymap.set("n", "[B", ":blast<CR>")
vim.keymap.set("n", "]c", ":cnext<CR>")
vim.keymap.set("n", "[c", ":cprev<CR>")
vim.keymap.set("n", "]C", ":cfirst<CR>")
vim.keymap.set("n", "[C", ":clast<CR>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
