-- File: lua/plugins/comment.lua
-- Enable commenting in any filetype, with VSCode-like keymaps

return {
    "numToStr/Comment.nvim",
    config = function()
        local api = require("Comment.api")
        require("Comment").setup()

        local keymap = vim.keymap.set
        local opts = { noremap = true, silent = true }

        -- VSCode-like: Ctrl+/ to toggle comment
        keymap("n", "<C-_>", function()
            api.toggle.linewise.current()
        end, opts)

        keymap("v", "<C-_>", function()
            -- escape visual mode before commenting
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "nx", false)
            api.toggle.linewise(vim.fn.visualmode())
        end, opts)

        -- Optional: Ctrl+Shift+A for block comment (like VSCode)
        keymap("n", "<C-S-A>", function()
            api.toggle.blockwise.current()
        end, opts)

        keymap("v", "<C-S-A>", function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "nx", false)
            api.toggle.blockwise(vim.fn.visualmode())
        end, opts)
    end,
}
