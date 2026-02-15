return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.config").setup({
            ensure_installed = { "lua", "python" },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
        })
    end,
}
