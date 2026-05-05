vim.keymap.set("n", ";", ":")
vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>e", function()
    require("oil").open()
end, { desc = "Open Oil" })

vim.keymap.set("n", "q", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "@", "<nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
