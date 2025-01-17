require("conform").setup({
    formatters_by_ft = {
        --        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        --        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { "eslint_d", "prettierd", stop_after_first = true },
        javascriptreact = { "eslint_d", "prettierd", stop_after_first = true },
        -- css = { "prettierd" },
        -- html = { "prettierd" },
        -- json = { "prettierd" },
        -- yaml = { "prettierd" },
        typescript = { "eslint_d", "prettierd", stop_after_first = true },
    },
    format_after_save = {
        -- These options will be passed to conform.format()
        async = true,
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
