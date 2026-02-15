return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    config = function()
        require("oil").setup({
            keymaps = {
                ["q"] = "actions.close",
                ["<C-h>"] = false,
                ["<C-j>"] = false,
                ["<C-k>"] = false,
                ["<C-l>"] = false,
            },
            view_options = {
                show_hidden = true,
            },
        })
    end,
    lazy = false,
}
