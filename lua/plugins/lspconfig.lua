return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "bashls",
                "jsonls",
            },
            automatic_installation = true,
        })

        local on_attach = function(_, bufnr)
            local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            map("n", "gd", vim.lsp.buf.definition, "LSP: Definition")
            map("n", "gr", vim.lsp.buf.references, "LSP: References")
            map("n", "K", vim.lsp.buf.hover, "LSP: Hover")
            map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
            map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: Code Action")
            map("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
            end, "LSP: Format")
        end

        -- capabilities
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local ok, cmp = pcall(require, "cmp_nvim_lsp")
        if ok then
            capabilities = cmp.default_capabilities(capabilities)
        end

        -- 0.11+ way: vim.lsp.config + vim.lsp.enable
        vim.lsp.config("lua_ls", {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        })

        vim.lsp.config("pyright", {
            on_attach = on_attach,
            capabilities = capabilities,
        })

        vim.lsp.config("bashls", {
            on_attach = on_attach,
            capabilities = capabilities,
        })

        vim.lsp.config("jsonls", {
            on_attach = on_attach,
            capabilities = capabilities,
        })

        vim.lsp.enable({ "lua_ls", "pyright", "bashls", "jsonls" })
    end,
}
