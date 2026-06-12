local fzf = require("fzf-lua")

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

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Recent files" })
vim.keymap.set("n", "<leader>gc", fzf.git_commits, { desc = "Git commits" })
vim.keymap.set("n", "<leader>gs", fzf.git_status, { desc = "Git status" })
vim.keymap.set("n", "<leader>ds", fzf.lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>ws", fzf.lsp_workspace_symbols, { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>dd", fzf.diagnostics_document, { desc = "Diagnostics" })
