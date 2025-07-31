require("conform").setup({
    formatters_by_ft = {
        html = { "prettier" },
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.html",
    callback = function()
        require("conform").format()
    end,
})
