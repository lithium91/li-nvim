vim.diagnostic.config({
    signs = false,
    underline = true,
    severity_sort = true,
    update_in_insert = false,

    virtual_text = {
        spacing = 2,
        source = "if_many",
        prefix = "",
    },

    float = {
        border = "rounded",
        source = "always",
        focusable = false,
    },
})

vim.opt.signcolumn = "no"

local function clear_bg(group)
    local hl = vim.api.nvim_get_hl(0, { name = group })
    if hl then
        hl.bg = nil
        vim.api.nvim_set_hl(0, group, hl)
    end
end

for _, group in ipairs({
    "DiagnosticVirtualTextError",
    "DiagnosticVirtualTextWarn",
    "DiagnosticVirtualTextInfo",
    "DiagnosticVirtualTextHint",
}) do
    clear_bg(group)
end
