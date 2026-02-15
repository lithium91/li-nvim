return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },

    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
                sh = { "shfmt" },
                bash = { "shfmt" },
                json = { "prettier" },
                markdown = { "prettier" },
            },

            format_on_save = {
                timeout_ms = 2000,
                lsp_fallback = true,
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                timeout_ms = 2000,
            })
        end, { desc = "Format file/range" })
    end,
}
