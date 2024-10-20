local lsp_zero = require('lsp-zero')
lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
    --local opts = {buffer = bufnr, remap = false}
    --    if client.server_capabilities.inlayHintProvider then
    --         vim.lsp.inlay_hint.enable(true)
    -- end

    vim.keymap.set("n", "<leader>uh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, {buffer = bufnr, remap = false, desc = "toggle inlay_hint"})
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = bufnr, remap = false, desc = "goto fn definition"})
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = false, desc = "hover"})
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {buffer = bufnr, remap = false, desc = "workspace_symbol"})
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {buffer = bufnr, remap = false, desc = "view diagnostic"})
    -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {buffer = bufnr, remap = false, desc = "goto_next error"})
    -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {buffer = bufnr, remap = false, desc = "goto_prev"})
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = false, desc = "fix error"})
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {buffer = bufnr, remap = false, desc = "view references"})
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {buffer = bufnr, remap = false, desc = "rename function"})
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {buffer = bufnr, remap = false, desc = "signature_help"})

end)

local lspconfig = require('lspconfig')
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'tsserver', 'rust_analyzer'},
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
        end,
--         pylsp = function()
--             lspconfig['pylsp'].setup({
--                 capabilities = capabilities,
--                 flags = {
--                     debounce_text_changes = 200,
--                 },
--                 settings = {
--                     pylsp = {
--                         plugins = {
--                             -- formatter options
--                             black = { enabled = true },
--                             autopep8 = { enabled = false },
--                             yapf = {enabled = false },
--                             -- linter options
--                             pylint = { enabled = false, executable = "pylint" },
--                             pyflakes = { enabled = false },
--                             pycodestyle = { enabled = false },
--                             -- type checker
--                             pylsp_mypy = { enabled = true },
--                             -- auto-completion options
--                             jedi_completion = { fuzzy = true},
--                             -- import sorting
--                             -- pyls_isort = { enabled = true},
--
--                         },
--                     },
--                 },
--             })
--         end,
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
