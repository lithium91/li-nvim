return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("bufferline").setup({
            options = {
                numbers = "ordinal",
                diagnostics = "nvim_lsp",
                show_buffer_close_icons = true,
                show_close_icon = false,
                always_show_bufferline = true,
            },
        })

        -- 🔑 Кеймапы

        local map = vim.keymap.set

        -- Переключение буферов
        map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
        map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })

        -- Прыжок по номеру
        for i = 1, 9 do
            map("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<cr>", { desc = "Go to buffer " .. i })
        end

        -- Закрытие буфера
        map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

        -- Закрыть все кроме текущего
        map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close others" })

        -- Перемещение буфера
        map("n", "<leader>bp", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
        map("n", "<leader>bn", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
    end,
}
