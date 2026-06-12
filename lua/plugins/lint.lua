return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },

    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            python = { "ruff" },
            sh = { "shellcheck" },
        }

        local timer = vim.uv.new_timer()
        local function debounced_lint()
            timer:stop()
            timer:start(
                150,
                0,
                vim.schedule_wrap(function()
                    pcall(lint.try_lint)
                end)
            )
        end

        local group = vim.api.nvim_create_augroup("Linting", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter" }, {
            group = group,
            callback = debounced_lint,
        })

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            group = group,
            callback = function()
                pcall(lint.try_lint)
            end,
        })
        vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
            group = group,
            callback = debounced_lint,
        })

        vim.keymap.set("n", "<leader>l", function()
            pcall(lint.try_lint)
        end, { desc = "Lint current buffer" })
    end,
}
