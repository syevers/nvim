require("conform").setup({
    formatters_by_ft = {
        --        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        --        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        typescript = { "prettierd" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        async = false,
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
