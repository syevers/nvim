-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
-- cmp.setup({
--     window = {
--         -- completion = cmp.config.window.bordered(),
--         documentation = cmp.config.window.bordered(),
--     },
--     format = function(_, vim_item)
--         vim_item.menu = ""
--         vim_item.kind = ""
--         return vim_item
--     end,
-- })
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
