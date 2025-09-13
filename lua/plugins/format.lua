return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 500,
            },
            formatters_by_ft = {
                c = { "clang_format" },
                cpp = { "clang_format" },
                lua = { "stylua" },
            },
        })
    end,
}
