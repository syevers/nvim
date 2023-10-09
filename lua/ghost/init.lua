require("ghost.remap")
require("ghost.set")
require("ghost.packer")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- local augroup = vim.api.nvim_create_augroup
--local ThePrimeagenGroup = augroup('ThePrimeagen', {})

-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd({"BufWritePre"}, {
--   group = ThePrimeagenGroup,
--   pattern = "*",
--    command = [[%s/\s\+$//e]],
-- })
