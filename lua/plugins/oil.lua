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
            },
            view_options = {
                show_hidden = true,
            },
        })
    end,
    lazy = false,
}
