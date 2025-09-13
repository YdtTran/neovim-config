return {
    "pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup({
            debounce_delay = 135,
            execution_message = {
                message = function()
                    return "💾 AutoSave at " .. vim.fn.strftime("%H:%M:%S")
                end,
            },
        })
    end,
}
