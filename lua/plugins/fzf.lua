return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("fzf-lua").setup({
            winopts = {
                height = 1.0,
                width = 1.0,
                preview = {
                    layout = "horizontal",
                },
            },
        })
    end
}
