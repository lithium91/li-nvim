return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        local notify = require("notify")

        notify.setup({
            background_colour = "#000000",
            timeout = 2000, -- 2 секунды
            render = "minimal", -- минималистичный стиль
            stages = "fade", -- плавное появление
            max_width = 50,
            max_height = 10,
        })

        vim.notify = notify
    end,
}
