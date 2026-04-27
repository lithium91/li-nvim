return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                globalstatus = true,
                section_separators = "",
                component_separators = "",
                disabled_filetypes = {},
            },

            sections = {
                lualine_a = { { 'mode', fmt = function(res) return res:sub(1, 1) end } },

                lualine_b = {
                    {
                        "filename",
                        path = 1,
                        symbols = {
                            modified = "",
                            readonly = "",
                        },
                        color = require("lualine.themes.auto").normal.c
                    },
                },

                lualine_c = {
                    {
                        "diff",
                        symbols = { added = "+", modified = "~", removed = "-" },
                    }
                },

                lualine_x = {
                    { "filetype", icon_only = false },
                },

                lualine_y = {
                    { "branch", icon = "" },
                },

                lualine_z = {
                    { "location" },
                },
            },

            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
