local lsp_zero = require('lsp-zero')
lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
       if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(false)
       -- DEPRECATED vim.lsp.inlay_hint.enable(bufnr, true)
        end
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

end)

local lspconfig = require('lspconfig')
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'ts_ls', 'rust_analyzer'},
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            lspconfig.lua_ls.setup(lua_opts)
        end,
        basedpyright = function()
            lspconfig['basedpyright'].setup({
                capabilities = capabilities,
                settings = {
                    basedpyright = {
                        -- typeCheckingMode = "standard",
                        typeCheckingMode = "off",
                    },
                },
            })
        end
    }
})
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'luasnip'},
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        --['<C-y>'] = cmp.mapping.confirm({ select = true }),
    }),
})

lsp_zero.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

require('luasnip.loaders.from_vscode').lazy_load()


vim.diagnostic.config({
    virtual_text = true
})
